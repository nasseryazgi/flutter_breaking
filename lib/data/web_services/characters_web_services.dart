import 'dart:convert';

import 'package:flutter_breaking/constants/strings.dart';
import 'package:http/http.dart' as http;

class CharacterWebServies {
  Future<Map<String, dynamic>> getAllCharacterWebServices() async {
    http.Response response = await http.get(Uri.parse('${baseUrl}character'));
    try {
      print(response.body);
      var character = jsonDecode(response.body);
      return character;
    } catch (e) {
   //   print(e.toString());
      var character = jsonDecode(response.body);
      return character;
    }
  }
}
