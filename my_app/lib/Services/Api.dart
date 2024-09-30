import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:my_app/Model/Address.dart';

class Api {
  final String apiKey = 'o6qocf7QAZWmlgLaadqtitvHgfIpuwBSyBjGR5n8Kqw';

  Future<List<Address>> fetchAddresses(String query) async {
    final encodedQuery = Uri.encodeComponent(query);
    final String apiUrl =
        'https://geocode.search.hereapi.com/v1/geocode?q=$encodedQuery&limit=10&apiKey=$apiKey&in=countryCode:VNM';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final decodedResponse = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> jsonResponse = json.decode(decodedResponse);
      final List<dynamic> items = jsonResponse['items'];
      return items.map<Address>((item) {
        return Address.fromJson(item);
      }).toList();
    } else {
      throw Exception('Failed to load addresses');
    }
  }
}
