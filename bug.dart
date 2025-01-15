```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the response is a JSON list
      final jsonData = jsonDecode(response.body);
      // Accessing the first element directly without checking if it exists
      final firstElement = jsonData[0];
      print(firstElement['name']); // Error: Could throw an exception
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```