void main() {
  final myStream = Stream<int>.periodic(
      const Duration(seconds: 1),
          (x) => x+1)
      .take(10);

  myStream
  .where((i) => i % 2 == 0)
  .map((i) => 'String $i')
      .listen(print);
}