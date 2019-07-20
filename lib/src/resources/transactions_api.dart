import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hepengta/src/models/group_card_data.dart';
import 'package:hepengta/src/models/history.dart';
import 'package:http/http.dart';

class TransactionApi {
  Client client = Client();
  String baseURL = "http://10.0.2.2:8000/api"; //DotEnv().env['API_BASE_URL'];

  Future<List<History>> getTransactions(int limit, int month) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'secret-header' : DotEnv().env['SECRET_TOKEN'],
    };
    
    final response = await client.get(baseURL + "/transactions?limit=" + limit.toString() + "&month=" + month.toString(),
      headers: requestHeaders,
    );

    final data = List<Map<String, dynamic>>.from(json.decode(response.body));
    return data.map((j) => History.fromJson(j)).toList();
  }
}