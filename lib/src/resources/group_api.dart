import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hepengta/src/models/group_card_data.dart';
import 'package:http/http.dart';

class GroupApi {
  Client client = Client();
  String baseURL = "http://10.0.2.2:8000/api"; //DotEnv().env['API_BASE_URL'];

  Future<List<GroupCardData>> getGroups(int limit) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'secret-header' : DotEnv().env['SECRET_TOKEN'],
    };

    final response = await client.get(baseURL + "/groups?limit=" + limit.toString() + "&user_id=1",
      headers: requestHeaders,
    );

    final data = List<Map<String, dynamic>>.from(json.decode(response.body));
    return data.map((j) => GroupCardData.fromJson(j)).toList();
  }

  Future<bool> createGroup(String name, String targetAmount, String targetDate, bool isCustomized, String createBy) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Map<String, dynamic> body = {
      "user_id": createBy,
      "name": name,
      "target_amount": targetAmount,
      "target_date": targetDate,
      "is_customized": isCustomized,
    };
    
    print(body);

    final response = await client.post(baseURL + "/groups",
      headers: requestHeaders,
      body: jsonEncode(body)
    );
    
    print(response.body);

    if(response.statusCode == 200) {
      return true;
    }

    return false;
  }
}