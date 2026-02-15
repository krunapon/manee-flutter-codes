void main() {
  Future.delayed(
    Duration(seconds: 3),
        () => throw 'Error!', // Complete with an error.
  ).then((value) {
    print(value);
  }).catchError((err) {
    print('Caught $err'); // Handle the error.
  });
  print('Waiting for a value...');
}