import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hepengta/src/models/group_card_data.dart';
import 'package:http/http.dart';

class ProductAPI {
  Client client = Client();
  final baseURL = DotEnv().env['API_BASE_URL'];

  static const PRODUCT = "ProductAPI/1.0/product";
  static const PRODUCT_CREDIT_CARD = "ProductAPI/1.0/promotion/creditCard";
  static const PRODUCT_DEBIT_CARD = "ProductAPI/1.0/promotion/debitCard";
  static const PRODUCT_PERSONAL_LOAN = "ProductAPI/1.0/promotion/personalLoan";
  static const PRODUCT_SAVING_ACCOUNT = "ProductAPI/1.0/promotion/savingAccount";
  static const PRODUCT_TIME_DEPOSIT = "ProductAPI/1.0/product/timeDeposit";

  Future<List<GroupCardData>> getProduct() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await client.get(baseURL+"/api/auth/login",
      headers: requestHeaders,
    );
  }
}