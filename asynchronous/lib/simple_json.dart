import 'dart:convert';

using_json_decode() {
  const jsonData = '{"name":"Somtum Pokpak", "cuisine": "Thai"}';

// decode the json
  final parsedJson = jsonDecode(jsonData);

  // print the type and value
  print('${parsedJson.runtimeType} : $parsedJson');
}

class Restaurant {
  Restaurant({required this.name, required this.cuisine});
  final String name;
  final String cuisine;

  factory Restaurant.fromJson(Map<String, dynamic> data) {
    // note the explicit cast to String
    // this is required if robust lint rules are enabled
    final name = data['name'] as String;
    final cuisine = data['cuisine'] as String;
    return Restaurant(name: name, cuisine: cuisine);
  }
}

using_factory_constructor() {
  // type: String
  final jsonData = '{"name":"Somtum Pokpak", "cuisine": "Thai"}';
// type: dynamic (runtime type: _InternalLinkedHashMap<String, dynamic>)
  final parsedJson = jsonDecode(jsonData);
// type: Restaurant
  final restaurant = Restaurant.fromJson(parsedJson);
  // print the type and value
  print('Restaurant is ${restaurant.name} has cusine as ${restaurant.cuisine}');
}
main() {
  using_json_decode();
  using_factory_constructor();
}


