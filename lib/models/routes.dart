import 'package:flutter/widgets.dart';
import 'package:rizensoft_mobile_app_flutter/view/home.dart';
import 'package:rizensoft_mobile_app_flutter/view/onboarding/login_view.dart';
import 'package:rizensoft_mobile_app_flutter/view/splash_view.dart';

enum PackageRoutes {
  // Generic
  home('/home'),
  splash('/splash'),
  // Login
  login('/login');

  final String path;
  const PackageRoutes(this.path);
}

class Routes {
  static Map<String, WidgetBuilder> get routes => {
        // Generic
        PackageRoutes.home.path: (context) => Home(routes),
        PackageRoutes.splash.path: (context) => SplashView(),
        
        PackageRoutes.login.path: (context) => LoginView(),
      };
}