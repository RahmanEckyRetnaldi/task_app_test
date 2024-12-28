import 'package:common_dependency/common_dependency.dart';

export 'error_message_failure.dart';

class RuntimeFailure extends Failure {
  const RuntimeFailure();

  @override
  String get message => 'Run Time Failure call contact service';

  @override
  List<Object?> get props => [message];
}

class FormatEmailFailure extends Failure {
  const FormatEmailFailure(super.message);

  @override
  List<Object?> get props => [message];
}