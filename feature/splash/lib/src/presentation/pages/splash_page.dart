import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash/src/presentation/pages/cubit/splash_cubit.dart';

import 'event/SplashEvent.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SplashCubit>()..init(),
      child: const SplashUI(),
    );
  }
}

class SplashUI extends StatelessWidget {
  const SplashUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<SplashCubit, SplashState>(
            listenWhen: (previous, current) =>
            current.splashEvent != null &&
                previous.splashEvent != current.splashEvent,
            listener: (context, state) {
              switch (state.splashEvent.runtimeType) {
                case GoToLogin:
                  return context.go(AuthNav.login.fullpath);
                default:
                  return context.go(TaskNav.task.fullpath);
              }
            },
          ),
          BlocListener<SplashCubit, SplashState>(
            listenWhen: (previous, current) =>
                previous.getSplashStatus != current.getSplashStatus,
            listener: (context, state) {
              if (state.getSplashStatus == FormzStatus.submissionSuccess) {
                context.read<SplashCubit>().redirectPage();
              }
            },
          ),
        ],
        child: BasePage<SplashCubit,SplashState>(
          overridesFailureHandling: (failure){
            return false;
          },
          customLoading: const BaseLoadingAnimation(
            color: AppColors.background,
          ),
          child: BlocBuilder<SplashCubit, SplashState>(
            buildWhen: (prev, current) => prev.getSplashStatus != current.getSplashStatus,
            builder: (context, state){
              return Scaffold(
                backgroundColor: Theme.of(context).colorScheme.primary,
                appBar: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                extendBodyBehindAppBar: true,
                body: _getBody(context, state),
              );
            },
          ),

        )
    );
  }
}
Widget _getBody(BuildContext context, SplashState state) {
  if (state.getSplashStatus.isSubmissionInProgress) {
    return const SizedBox.shrink();
  }

  return SizedBox(
    height: context.screenHeight,
    child: AspectRatio(
      aspectRatio: 9 / 16,
      child: Image.asset(
        ImageAssets.appIcon,
        fit: BoxFit.fitHeight,
      ),
    ),
  );
}

