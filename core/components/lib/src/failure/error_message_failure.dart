import 'package:common_dependency/common_dependency.dart';

class ErrorMessageFailure extends Failure {
  final String errMsg;
  final String? statusCode;

  const ErrorMessageFailure(this.errMsg, [this.statusCode]);
  @override
  String get message => errMsg;
  @override
  List<Object?> get props => [message];
}
