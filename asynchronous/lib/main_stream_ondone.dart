void main() {
  final myStream = Stream<int>.periodic(
      const Duration(seconds: 1),
          (x) => x+1)
      .take(5);

  final subscription = myStream.listen(
        (data)  {
          print('Data: $data');
        },
        onError: (err) {
          print('Error!');
        },
        cancelOnError: false,
        onDone: () {
          print('Done!');
        },
  );
}