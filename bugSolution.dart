```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body) as Map<String, dynamic>?; 
      } on FormatException catch (e) {
        print('Invalid JSON format: $e');
        return null; // Or throw a custom exception
      } catch (e) {
        print('Error decoding JSON: $e');
        return null; // Or throw a custom exception
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching or processing data: $e');
    return null; // Or rethrow the exception as appropriate for your app
  }
}
```