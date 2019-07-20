import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class ProductAPI {
  Client client = Client();
  final baseURL = DotEnv().env['API_BASE_URL'];

  static const MRT_ACCOUNT = "SalesAPI/1.0/fee/mtrAccount";
  static const SAVING_ACCOUNT = "SalesAPI/1.0/fee/savingAccount";
  static const TABUNGAN_VALAS = "SalesAPI/1.0/fee/tabunganValas";
  static const RATES = "SalesAPI/1.0/fee/rates";
  static const RATES_CURRENCY = "SalesAPI/1.0/rates/{currency}";
  

  void getProduct() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await client.get(baseURL+"/api/auth/login",
      headers: requestHeaders,
    );

    print(response);
  }
}