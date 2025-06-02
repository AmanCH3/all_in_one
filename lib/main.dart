import 'package:all_in_one/app.dart';
import 'package:all_in_one/service_locator/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // make sure dependies is run first
  await initDependencies(); // first load the dependencies the only run the application
  runApp(const App());
}
