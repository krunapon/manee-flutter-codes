void main() {
  final myStream = Stream<int>.periodic(
      const Duration(seconds: 1),
          (x) => x+1)
      .take(5);

  myStream.map((i) => 'String $i').listen(print);
}