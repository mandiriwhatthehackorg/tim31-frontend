import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class ServicingAPI {
  Client client = Client();
  final baseURL = DotEnv().env['API_BASE_URL'];

  static const CUSTOMER_CIF = "ServicingAPI/1.0/customer/{cifNumber}";
  static const CUSTOMER_CASA = "ServicingAPI/1.0/customer/casa/{accountNumber}";
  static const CUSTOMER_CASA_BALANCE = "ServicingAPI/1.0/customer/casa/{accountNumber}/balance";
  static const CUSTOMER_CASA_TRANSACTION = "ServicingAPI/1.0/customer/casa/{accountNumber}/transaction";
  static const CUSTOMER_CREDIT_CARD_BALANCE = "ServicingAPI/1.0/customer/creditcard/{ccNumber}/balance";
  static const CUSTOMER_CREDIT_CARD_TRANSACTION = "ServicingAPI/1.0/customer/creditcard/{ccNumber}/transaction";
  static const CUSTOMER_EBILLING = "ServicingAPI/1.0/customer/ebilling/{accountNumber}";
  static const CUSTOMER_LOAN_BALANCE = "ServicingAPI/1.0/customer/loan/{accountNumber}/balance";
  static const CUSTOMER_LOAN_TRANSACTION = "ServicingAPI/1.0/customer/loan/{accountNumber}/transaction";

  void registerEbilling() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Map<String, String> body = {
      "creditCardNumber": "",
      "customerName": "",
      "emailAddress": ""
    };

    final response = await client.post(baseURL + "/api/bookmark",
      headers: requestHeaders,
      body: jsonEncode(body)
    );

    print(response);
  }
}