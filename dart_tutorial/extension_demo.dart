extension StringValidation on String {
  bool get isValidEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);

  bool get isValidPassword => length >= 8;
}

// Usage in Flutter forms
void validateInput(String email, String password) {
  if (!email.isValidEmail) {
    print('Invalid email format');
  }
  if (!password.isValidPassword) {
    print('Password too short');
  }
}

void main() {
  validateInput("krunapon@kku.ac.th", "meesati4");
}
