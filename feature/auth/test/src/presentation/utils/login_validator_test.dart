


import 'package:auth/src/presentation/utils/login_validator.dart';
import 'package:test/test.dart';

void main(){
  group('LoginValidator', () {
    const validator = LoginValidator();

    group('validateEmail', () {
      test('should return error when email is empty', () {
        final result = validator.validateEmail('');
        expect(result, 'Email is required');
      });

      test('should return error when email is invalid', () {
        final result = validator.validateEmail('invalid-email');
        expect(result, 'Invalid email');
      });

      test('should return empty string when email is valid', () {
        final result = validator.validateEmail('example@mail.com');
        expect(result, '');
      });
    });

    group('validatePassword', () {
      test('should return error when password is empty', () {
        final result = validator.validatePassword('');
        expect(result, 'Password is required');
      });

      test('should return error when password is less than 8 characters', () {
        final result = validator.validatePassword('12345');
        expect(result, 'Password must be at least 8 characters');
      });

      test('should return empty string when password is valid', () {
        final result = validator.validatePassword('password123');
        expect(result, '');
      });
    });
  });

}