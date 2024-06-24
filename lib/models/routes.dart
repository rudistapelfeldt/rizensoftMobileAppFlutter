import 'package:flutter/widgets.dart';
import 'package:rizensoft_mobile_app_flutter/view/dashboard_view.dart';
import 'package:rizensoft_mobile_app_flutter/view/home.dart';
import 'package:rizensoft_mobile_app_flutter/view/onboarding/login_view.dart';
import 'package:rizensoft_mobile_app_flutter/view/onboarding/registration_view.dart';
import 'package:rizensoft_mobile_app_flutter/view/reminders_view.dart';
import 'package:rizensoft_mobile_app_flutter/view/splash_view.dart';

enum PackageRoutes {
  // Generic
  home('/home'),
  splash('/splash'),
  // Login
  login('/login'),
  //register
  register('/register'),
  //dashboard
  dashboard('/dashboard'),
  //reminders
  reminders('/reminders');

  final String path;
  const PackageRoutes(this.path);
}

class Routes {
  static Map<String, WidgetBuilder> get routes => {
        // Generic
        PackageRoutes.home.path: (context) => Home(routes),
        PackageRoutes.splash.path: (context) => SplashView(),
        PackageRoutes.dashboard.path:(context) => DashboardView(routes),
        PackageRoutes.reminders.path:(context) => RemindersView(routes),
        PackageRoutes.login.path: (context) => LoginView(),
        PackageRoutes.register.path: (context) => RegistrationView(),
      };
}