import 'package:all_in_one/app.dart';
import 'package:all_in_one/service_locator/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies(); // make sure dependies is run first
  runApp(App());
}
