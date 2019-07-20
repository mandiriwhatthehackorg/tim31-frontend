import 'package:hepengta/src/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(App());
}
