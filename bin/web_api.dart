import 'dart:convert';

import 'package:http/http.dart' as http;

abstract interface class IWebApi {
  Future<String> getRandomAdvice();
  Future<String> getAnswer(String question, [bool lucky = true]);
}

class WebApi implements IWebApi {
  @override
  Future<String> getAnswer(String question, [bool lucky = true]) async {
    var url = Uri.https("eightballapi.com", '/api/biased', {"question": question, "lucky": lucky.toString()});
    final response = await http.get(url);
    final Map<String, dynamic> decoded = jsonDecode(response.body);
    return decoded["reading"];
  }

  @override
  Future<String> getRandomAdvice() async {
    var url = Uri.https("eightballapi.com", '/api');
    var response = await http.get(url);
    final Map<String, dynamic> decoded = jsonDecode(response.body);
    return decoded["reading"];
  }

  
}

