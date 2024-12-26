
class LoginValidator{
  const LoginValidator();

  String validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) return 'Invalid email';
    return '';
  }

  String validatePassword(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 8) return 'Password must be at least 8 characters';
    return '';
  }
}