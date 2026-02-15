void main() {
  final myFuture = Future(() {
    print('Creating the future.');
    return 12;
  });
  print('Done with main().');
}