import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rizensoft_mobile_app_flutter/models/api/custom_http_overrides.dart';
import 'package:rizensoft_mobile_app_flutter/view/app.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  HttpOverrides.global = CustomHttpOverrides();
  runApp(const App());
}
