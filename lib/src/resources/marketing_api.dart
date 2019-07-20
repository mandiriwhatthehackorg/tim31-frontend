import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class MarketingAPI {
  Client client = Client();
  final baseURL = DotEnv().env['API_BASE_URL'];

  static const PROMOTION = "MarketingAPI/1.0/promotion";
  static const ALL_MERCHANT_PROMOTION = "MarketingAPI/1.0/promotion/merchant";
  static const SINGLE_MERCHANT_PROMOTION = "MarketingAPI/1.0/promotion/merchant/{merchantId}";
  static const PROMOTION_PERIOD = "MarketingAPI/1.0/promotion/period";
  static const PROMOTION_VALUE = "MarketingAPI/1.0/promotion/value";

  void getPromotion() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'secret-header' : DotEnv().env['SECRET_TOKEN'],
    };

    final response = await client.get(baseURL+"/api/auth/login",
      headers: requestHeaders,
    );

    print(response);
  }
}