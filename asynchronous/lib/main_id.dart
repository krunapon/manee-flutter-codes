import 'dart:async';

Future<String> fetchUserData(int studentID) {
  int lastDigit = studentID % 10;
  return Future.delayed(const Duration(seconds: 3), () {
    // Simulate random success or failure
    if (lastDigit % 2 == 0) {
      return 'The last digit of my ID ($lastDigit) is an even number';
    } else {
      throw Exception('The last digit of my ID ($lastDigit) is an odd number');
    }
  });
}

void main() {
  fetchUserData(123456)
      .then((userData) => print('Complete with value: $userData'))
      .catchError((error) => print('Complete with error: $error'));
  fetchUserData(123457)
      .then((userData) => print('Complete with value: $userData'))
      .catchError((error) => print('Complete with error: $error'));
}
