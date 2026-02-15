import 'dart:async';
import 'dart:math';

Future<String> fetchUserData() {
  return Future.delayed(const Duration(seconds: 2), () {
    // Simulate random success or failure
    if (Random().nextBool()) {
      return 'User data fetched successfully!';
    } else {
      throw Exception('Failed to fetch user data!');
    }
  });
}

void main() {
  fetchUserData()
      .then((userData) => print('Received user data: $userData'))
      .catchError((error) => print('Error fetching data: $error'));
}
