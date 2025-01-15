```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Check if jsonData is a list and not empty
      if (jsonData is List && jsonData.isNotEmpty) {
        for (var element in jsonData) {
          // Check if the element is a map and contains the 'name' key
          if (element is Map && element.containsKey('name')) {
            print(element['name']);
          } else {
            print('Invalid data format for element: $element');
          }
        }
      } else {
        print('No data received or invalid JSON format.');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```