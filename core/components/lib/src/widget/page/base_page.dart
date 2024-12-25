import 'package:common_dependency/common_dependency.dart';
import 'package:components/src/widget/page/base_loading_animation.dart';
import 'package:components/src/widget/page/base_page_loading.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';

import '../dialog/base_dialog.dart';
import 'error_button_data.dart';

export 'base_page_listener.dart';
export 'base_page_state.dart';

class BasePage<BLOC extends BlocBase<STATE>, STATE extends BasePageState>
    extends HookWidget {
  final Widget child;
  final bool showDefaultLoading;
  final Widget? customLoading;
  final bool? Function(Failure failure)? overridesFailureHandling;
  final List<BlocListener>? blocListeners;
  final Widget Function(BuildContext context, STATE state)? builder;
  final ErrorButtonData? Function(Failure?)? errorButtonPositive;
  final ErrorButtonData? Function(Failure?)? errorButtonNegative;
  final String? Function(Failure?)? errorTitle;
  final String? Function(Failure?)? errorBody;

  final Function(STATE state)? onComplete;
  final Function(STATE state)? onSuccess;
  final Function()? onRetry;

  const BasePage({
    super.key,
    required this.child,
    this.showDefaultLoading = true,
    this.customLoading,
    this.onComplete,
    this.errorTitle,
    this.errorBody,
    this.errorButtonPositive,
    this.errorButtonNegative,
    this.onRetry,
    this.overridesFailureHandling,
    this.blocListeners,
    this.builder,
    this.onSuccess,
  });

  const BasePage.builder({
    super.key,
    required this.builder,
    this.showDefaultLoading = true,
    this.customLoading,
    this.errorButtonPositive,
    this.errorButtonNegative,
    this.onComplete,
    this.errorTitle,
    this.errorBody,
    this.overridesFailureHandling,
    this.onRetry,
    this.blocListeners,
    this.onSuccess,
  }) : child = const SizedBox();

  @override
  Widget build(BuildContext context) {
    var onInitScreenSuccess = useMemoized(() => false);
    return MultiBlocListener(
      listeners: [
        BlocListener<BLOC, STATE>(
          listenWhen: (previous, current) =>
              previous != current && notShowErrorSame(previous, current),
          listener: (_, state) {
            if (state.statusState.isSubmissionSuccess) {
              if (onSuccess != null) {
                onSuccess!(state);
              }
            }
            final error = state.errorState;
            if (error != null) {
              final bloc = BlocProvider.of<BLOC>(context);
              if (overridesFailureHandling == null ||
                  overridesFailureHandling?.call(error) == false) {
                if (bloc is BasePageListener) {
                  (bloc as BasePageListener).clearErrorState();
                }
                _showGeneralFailureDialog(context, error);
              }
            }

            if (!state.statusState.isSubmissionInProgress) {
              onInitScreenSuccess = !onInitScreenSuccess;
              if (onComplete != null) {
                onComplete!(state);
              }
            }
          },
        ),
        if (blocListeners != null) ...blocListeners!,
      ],
      child: BlocBuilder<BLOC, STATE>(
        buildWhen: (previous, current) {
          if (builder != null) return previous != current;
          return previous != current && notShowErrorSame(previous, current);
        },
        builder: (ctx, state) {
          List<Widget> widgetList = [
            BasePageLoading(
              opacity: customLoading == null ? 0.5 : 0,
              dismissible: false,
              isLoading: showDefaultLoading
                  ? state.statusState == FormzStatus.submissionInProgress
                  : false,
              progressIndicator: customLoading ?? const BaseLoadingAnimation(),
              child: builder?.call(ctx, state) ?? child,
            ),
          ];
          return Stack(
            children: widgetList,
          );
        },
      ),
    );
  }

  Future<void> executeRetry(BuildContext context) async {
    context.loaderOverlay.show(
      widget: const BaseLoadingAnimation(
        color: Colors.white,
      ),
    );
    await di<NetworkInfo>().isConnected.then(
      (value) {
        context.loaderOverlay.hide();
        if (value) {
          if (onRetry != null) {
            final bloc = BlocProvider.of<BLOC>(context);
            if (bloc is BasePageListener) {
              (bloc as BasePageListener).clearErrorState();
            }
            onRetry!();
          } else {
            context.pop();
          }
        }
      },
    );
  }

  Future<dynamic> _showGeneralFailureDialog(
    BuildContext context,
    Failure failure,
  ) {
    var errTitle = errorTitle?.call(failure) ?? 'Something went wrong';
    var errBody = errorBody?.call(failure) ?? failure.message;
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return BaseDialog(
          title: errTitle,
          body: errBody,
          negativeButtonTitle: errorButtonNegative?.call(failure)?.title,
          positiveButtonTitle:
              errorButtonPositive?.call(failure)?.title ?? 'Close',
          onPositiveButtonClicked: errorButtonPositive?.call(failure)?.onTap ??
              () => Navigator.of(context).pop(),
          onNegativeButtonClicked: errorButtonNegative?.call(failure)?.onTap ??
              () => Navigator.of(context).pop(),
        );
      },
    );
  }

  bool notShowErrorSame(STATE previous, STATE current) {
    return (current.errorState != null
        ? previous.errorState != current.errorState
        : current.errorState == null);
  }
}
