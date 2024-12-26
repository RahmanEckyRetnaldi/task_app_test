import 'package:common_dependency/common_dependency.dart';
import 'package:network/src/api/failure.dart';

import '../event/SplashEvent.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState>
    with CustomSyncEmit
    implements BasePageListener<SplashState> {
  SplashCubit() : super(const SplashState());

  void init() {
    getSplash();
  }

  Future<void> getSplash() async {
    syncEmit(
      (state) => state.copyWith(
        getSplashStatus: FormzStatus.submissionInProgress,
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    syncEmit(
      (state) => state.copyWith(
        getSplashStatus: FormzStatus.submissionSuccess
      ),
    );
  }

  Future<bool> get haveToken async {
    return false;
  }

  Future<void> redirectPage({bool longDelay = true}) async {
    if (longDelay) {
      await Future.delayed(const Duration(seconds: 3));
    } else {
      await Future.delayed(const Duration(milliseconds: 500));
    }
    if (await haveToken) {
      syncEmit((state) => state.copyWith(splashEvent: GoToHome()));
    } else {
      syncEmit((state) => state.copyWith(splashEvent: GoToLogin()));
    }
  }

  @override
  clearErrorState() {
    syncEmit((state) => state.copyWith(failure: null));
  }
}
