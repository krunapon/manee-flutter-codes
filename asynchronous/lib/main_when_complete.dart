import 'dart:async';

void main() {
  Future<int>.delayed(Duration(seconds: 3), () {
        return 100;
      })
      .then((value) {
        print(value);
      })
      .catchError((err) {
        print('Caught $err');
      }, test: (err) => err.runtimeType == String)
      .whenComplete(() {
        print('All finished');
      });
  print('waiting...');
}
