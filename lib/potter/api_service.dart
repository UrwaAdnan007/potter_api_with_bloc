import 'dart:convert';

import 'package:potter_api_bloc/potter/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<PotterModel>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://potterapi-fedeperin.vercel.app/es/characters?search=Weasley'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => PotterModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
