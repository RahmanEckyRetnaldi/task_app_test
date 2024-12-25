

import 'package:common_dependency/common_dependency.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure([this.message = '']);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure();
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  const NetworkFailure();
  @override
  get message => 'Check Your Internet';
  @override
  List<Object?> get props => [];
}

class DomainFailure extends Failure {
  const DomainFailure();
  @override
  List<Object?> get props => [];
}

class UseCaseFailure extends Failure {
  const UseCaseFailure();
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  const CacheFailure();
  @override
  List<Object?> get props => [];
}

class UnAuthorizedFailure extends Failure {
  const UnAuthorizedFailure();
  @override
  List<Object?> get props => [];
}

class BadResponseFailure extends Failure {
  final dynamic code;
  final dynamic data;
  const BadResponseFailure([this.data, this.code]);
  @override
  List<Object?> get props => [data, code];
}

class UnRecognizedFailure extends Failure {
  final dynamic exception;
  const UnRecognizedFailure([this.exception]);
  @override
  List<Object?> get props => [exception];
}

class FormatFailure extends Failure {
  const FormatFailure();
  @override
  List<Object?> get props => [];
}
