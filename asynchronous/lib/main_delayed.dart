void main() {
  Future.delayed(const Duration(seconds: 3), () => 100).then((value) {
    // Prints later, after 3 seconds.
    print('The value is $value.');
  });
  // Prints first.
  print('Waiting for a value...');
}
