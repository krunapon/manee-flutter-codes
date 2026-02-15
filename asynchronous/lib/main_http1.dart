import 'package:http/http.dart' as http;

Future<String> fetchPublicIP() async {
  try {
    final response = await http.get(Uri.parse('http://api.ipify.org'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load IP address');
    }
  } catch (e) {
    throw Exception('Failed to connect to the API: $e');
  }
}

void main() {
  fetchPublicIP().then((ip) {
    print('Your public IP address is: $ip');
  }).catchError((error) {
    print('Error: $error');
  });
}
