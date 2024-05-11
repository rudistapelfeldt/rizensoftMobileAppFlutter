import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/navigation_helper.dart';
import 'package:rizensoft_mobile_app_flutter/models/api/custom_http_overrides.dart';
import 'package:rizensoft_mobile_app_flutter/models/routes.dart';
import 'package:rizensoft_mobile_app_flutter/view/home.dart';

void main() {
  Map<String, WidgetBuilder>? appRoutes = Routes.routes;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  HttpOverrides.global = CustomHttpOverrides();
  runApp(Home(NavigationHelper.allNavigationRoutes(appRoutes: appRoutes)));
}
