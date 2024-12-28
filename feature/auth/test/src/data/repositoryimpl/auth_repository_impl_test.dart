import 'package:auth/auth.dart';
import 'package:auth/src/data/datasource/auth_local_ds.dart';
import 'package:auth/src/data/datasource/auth_remote_ds.dart';
import 'package:auth/src/data/model/request/login_request_model.dart';
import 'package:auth/src/data/model/response/login_response_model.dart';
import 'package:auth/src/data/repositoryimpl/auth_repository_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:dartz/dartz.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class FakeUserModel extends Fake implements UserModel {}
class FakeLoginRequestModel extends Fake implements LoginRequestModel {}


void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockAuthLocalDataSource mockAuthLocalDataSource;
  late AuthRepositoryImpl authRepository;

  setUpAll(() {
    registerFallbackValue(FakeLoginRequestModel());
    registerFallbackValue(FakeUserModel());
  });

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    authRepository = AuthRepositoryImpl(
      mockAuthRemoteDataSource,
      mockAuthLocalDataSource,
    );
  });

  group('login', () {
    test('should return access token and save user on successful login', () async {
      // Arrange
      final loginEntity = LoginEntity(email: 'user', password: 'pass');
      final loginResponse = LoginResponseModel(accessToken: 'mockToken');
      when(() => mockAuthRemoteDataSource.login(any()))
          .thenAnswer((_) async => loginResponse);
      when(() => mockAuthLocalDataSource.saveUser(any()))
          .thenAnswer((_) async => Future.value());

      // Act
      final result = await authRepository.login(loginEntity);

      // Assert
      result.fold(
            (failure) => fail('Expected Right, got Left: $failure'),
            (token) {
          expect(token, 'mockToken');
        },
      );
      verify(() => mockAuthRemoteDataSource.login(any())).called(1);
      verify(() => mockAuthLocalDataSource.saveUser(any())).called(1);
    });
  });

  group('isLoggedIn', () {
    test('should return true when user is logged in', () async {
      // Arrange
      when(() => mockAuthLocalDataSource.getUser())
          .thenAnswer((_) async => UserModel(token: 'mockToken'));

      // Act
      final result = await authRepository.isLoggedIn();

      // Assert
      expect(result, true);
      verify(() => mockAuthLocalDataSource.getUser()).called(1);
    });

    test('should return false when user is not logged in', () async {
      // Arrange
      when(() => mockAuthLocalDataSource.getUser())
          .thenAnswer((_) async => null);

      // Act
      final result = await authRepository.isLoggedIn();

      // Assert
      expect(result, false);
      verify(() => mockAuthLocalDataSource.getUser()).called(1);
    });
  });

  group('logout', () {
    test('should delete user on logout', () async {
      // Arrange
      when(() => mockAuthLocalDataSource.deleteUser())
          .thenAnswer((_) async => Future.value());

      // Act
      await authRepository.logout();

      // Assert
      verify(() => mockAuthLocalDataSource.deleteUser()).called(1);
    });
  });
}
