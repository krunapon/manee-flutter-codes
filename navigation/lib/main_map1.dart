import 'package:flutter/material.dart';

void main() {
  var data = {'name': 'Manee Deejai', 'occupation': 'Teacher'};
  debugPrint('$data');
  var nameVal = data['name'];
  var dataLen = data.length;
  debugPrint('$nameVal');
  debugPrint('$dataLen');

  data.forEach((key, val) {
    debugPrint('{key: $key, value: $val}');
  });
}