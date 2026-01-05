void main() {
  // Basic example - creating a list of numbers 0 to 4
  List<int> numbers = List.generate(5, (index) => index);

  // Result: [0, 1, 2, 3, 4]
  print(numbers);

  // Creating squares, similar to the Python example above
  List<int> squares = List.generate(5, (index) => index * index);
  squares.add(25);
  print(squares);

  List<Map<String, dynamic>> users = List.generate(
    3,
    (index) => {
      'id': index + 1,
      'name': 'User ${index + 1}',
      'isActive': index % 2 == 0,
    },
  );
  print(users);
}
