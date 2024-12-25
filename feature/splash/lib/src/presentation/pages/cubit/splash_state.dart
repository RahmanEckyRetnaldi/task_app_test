part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState implements BasePageState {
  const SplashState._();

  const factory SplashState({
    @Default(FormzStatus.pure) FormzStatus getSplashStatus,
    Failure? failure,
    SplashEvent? splashEvent,
  }) = _SplashState;

  @override
  Failure? get errorState => failure;

  @override
  FormzStatus get statusState => getSplashStatus;
}
