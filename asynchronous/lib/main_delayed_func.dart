import 'dart:async';

Future fetchUserOrder() {
  // image that this function is fetching
  // user info from another service or database
  return Future.delayed(Duration(seconds: 2), () => print('Large Latte'));
}

void main() {
  fetchUserOrder();
  print('Fetching user order...');
}
