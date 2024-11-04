import 'package:filmood/data/core/api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ApiClient {
  final http.Client _client;


  ApiClient(this._client);

  Future<dynamic> get(String path) async {
    final response = await _client.get(
      Uri.parse('${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}'),
      headers:{
        'Content-Type':'application/json',
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body); // Decode JSON response
      return jsonResponse;
    }else{
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }

}