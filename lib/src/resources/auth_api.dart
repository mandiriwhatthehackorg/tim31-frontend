import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class AuthAPI {
  Client client = Client();
  final baseURL = DotEnv().env['API_BASE_URL'];

  //ADMIN USECASE
  static const REGISTER = "/register";
  static const LOGIN = "/login";
  static const INSERT_BRANCH = "/insertBranch";
  static const INSERT_CARD = "/insertCard";
  static const INSERT_PRODUCT = "/insertProduct";
  static const INSERT_CITIZEN = "/insertCitizen";
  static const GET_BRANCH = "/getBranch";
  static const GET_CARD = "/getCard";
  static const GET_PRODUCT = "/getProduct";
  static const GET_CITIZEN = "/getCitizen";
  static const DELETE_BRANCH = "/deteleBranch?branchCode=";
  static const DELETE_CARD = "/deleteCard?cardCode=";
  static const DELETE_PRODUCT = "/deleteProdcut?productCode=";
  static const DELETE_CITIZEN = "/deleteCitizen?id=";

  //AGENT USECASE
  static const GET_KYC = "/getKYCData";
  static const ADD_KYC = "/SubmitKYCResult";

  //CLIENT USECASE
  static const CREATE_SESSION = "/initiate/createSession";
  static const RESEND_OTP = "/initiate/resendOTP";
  static const VALIDATE_OTP = "initiate/validateOTP";
  static const SUBMIT_DATA = "/submitData";
  static const SUBMIT_KTP_IMAGE = "/submitImageKTP";
  static const SUBMIT_SELFIE_IMAGE = "/submitImageSelfie";
  static const SUBMIT_SIGNATURE_IMAGE = "/submitImageSignature";
  static const DO_KYC = "/KYC";
  static const CREATE_ACCOUNT = "/createAccount";


  void submitData() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Map<String, String> body = {
      "productType": "<product code>",
      "cardType": "<card code>",
      "motherName": "<mother name>",
      "branchCode": "<branch code>",
      "branchCode": "<branch code>"
    };

    final response = await client.post(baseURL + "/api/bookmark",
      headers: requestHeaders,
      body: jsonEncode(body)
    );

    print(response);
  }

  void addKYC() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Map<String, String> body = {
      "callReff": "tQzqr",
      "nik": "true",
      "nama": "true",
      "dob": "true",
      "phone": "true",
      "alamat": "true",
      "motherName": "true",
      "ktp": "true",
      "selfie": "true",
      "ttd": "true",
      "product": "true",
      "card": "true",
      "branch": "true"
    };

    final response = await client.post(baseURL + "/api/bookmark",
      headers: requestHeaders,
      body: jsonEncode(body)
    );

    print(response);
  }


  void insertBranch() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Map<String, String> body = {
      "branchCode": "",
      "branchAddress": "",
      "branchName": ""
    };

    final response = await client.post(baseURL + "/api/bookmark",
      headers: requestHeaders,
      body: jsonEncode(body)
    );

    print(response);
  }

  void insertCard() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Map<String, String> body = {
      "cardCode": "",
      "cardName": "",
    };

    final response = await client.post(baseURL + "/api/bookmark",
      headers: requestHeaders,
      body: jsonEncode(body)
    );

    print(response);
  }

  void insertProduct() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Map<String, String> body = {
      "productCode": "",
      "productName": "",
    };

    final response = await client.post(baseURL + "/api/bookmark",
      headers: requestHeaders,
      body: jsonEncode(body)
    );

    print(response);
  }

  void insertCitizen() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Map<String, String> body = {
      "nik": "",
      "name": "",
      "dob": "",
      "address": ""
    };

    final response = await client.post(baseURL + "/api/bookmark",
      headers: requestHeaders,
      body: jsonEncode(body)
    );

    print(response);
  }
}