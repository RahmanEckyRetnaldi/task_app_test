import 'package:formz/formz.dart';
import 'package:network/network.dart';

abstract class BasePageState {
  Failure? get errorState;

  FormzStatus get statusState;

  @override
  bool operator ==(Object other) {
    return other is BasePageState &&
        other.errorState == errorState &&
        other.statusState == statusState;
  }

  @override
  int get hashCode {
    return errorState.hashCode ^ statusState.hashCode;
  }
}
