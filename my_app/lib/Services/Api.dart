import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/Model/Address.dart';

class Api {
  final String apiUrl =
      'https://geocode.search.hereapi.com/v1/geocode?q=240+Washington+St.%2C+Boston&limit=4&apiKey=o6qocf7QAZWmlgLaadqtitvHgfIpuwBSyBjGR5n8Kqw';

  Future<List<Address>> fetchAddresses() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> items = jsonResponse['items'];
      return items.map<Address>((item) {
        return Address.fromJson(item);
      }).toList();
    } else {
      throw Exception('Failed to load addresses');
    }
  }
}
