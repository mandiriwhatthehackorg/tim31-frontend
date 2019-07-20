import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class BillAPI {
  Client client = Client();
  final baseURL = DotEnv().env['API_BASE_URL'];

  static const BILL_PRODUCT = "TrxAndPaymentAPI/1.0/bill";
  static const BILL_AXA = "TrxAndPaymentAPI/1.0/bill/axafinancial/{customerId}";
  static const BILL_EDUCATION = "TrxAndPaymentAPI/1.0/bill/education/{customerId}";
  static const BILL_FIRST_MEDIA = "TrxAndPaymentAPI/1.0/bill/firstmedia/{customerId}";
  static const BILL_INDOSAT = "TrxAndPaymentAPI/1.0/bill/indosat";
  static const BILL_INDOSAT_MSISDN = "TrxAndPaymentAPI/1.0/bill/indosat/{product}/{msisdn}";
  static const BILL_KAI = "TrxAndPaymentAPI/1.0/bill/kai/{bookingCode}";
  static const BILL_PAM = "TrxAndPaymentAPI/1.0/bill/pam/{customerId}";
  static const BILL_PLN = "TrxAndPaymentAPI/1.0/bill/pln/{customerId}";
  static const BILL_TELKOMSEL = "TrxAndPaymentAPI/1.0/bill/telkomsel";
  static const BILL_TELKOMSEL_MSISDN = "TrxAndPaymentAPI/1.0/bill/telkomsel/{product}/{msisdn}";
  static const BILL_THREE = "TrxAndPaymentAPI/1.0/bill/three";
  static const BILL_THREE_MSISDN = "TrxAndPaymentAPI/1.0/bill/three/{product}/{msisdn}";
  static const BILL_XL = "TrxAndPaymentAPI/1.0/bill/xl";
  static const BILL_XL_MSISDN = "TrxAndPaymentAPI/1.0/bill/xl/{product}/{msisdn}";
  static const BILL_TV = "TrxAndPaymentAPI/1.0/bill/tv/{customerId";

  static const CREDIT_CARD_MANDIRI = "TrxAndPaymentAPI/1.0/creditcard/mandiri/{ccNumber}";
  static const EMONEY = "TrxAndPaymentAPI/1.0/emoney/emoney/{cardNumber}";
  static const TRANSFER = "TrxAndPaymentAPI/1.0/transfer";
  static const TRANSFER_PRIMA = "TrxAndPaymentAPI/1.0/transfer/prima";
  static const TRANSFER_RTGS = "TrxAndPaymentAPI/1.0/transfer/rtgs";
  static const TRANSFER_SKN = "TrxAndPaymentAPI/1.0/transfer/skn";
  static const EMONEY_LINKAJA = "TrxAndPaymentAPI/1.0/emoney/linkaja/{customerId}";
  static const EMONEY_GOPAY = "TrxAndPaymentAPI/1.0/emoney/gopay/{customerId}";
  static const EMONEY_OVO = "TrxAndPaymentAPI/1.0/emoney/ovo/{customerId}";



  void createBillAxa() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Map<String, String> body = {
      "currency": "",
      "debitAccount": "",
      "debitAccount": "",
      "billingId": "",
      "companyAccountNumber": ""
    };

    final response = await client.post(baseURL + "/api/bookmark",
      headers: requestHeaders,
      body: jsonEncode(body)
    );

    print(response);
  }
}