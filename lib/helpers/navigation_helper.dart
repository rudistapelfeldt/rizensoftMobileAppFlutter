import 'package:flutter/widgets.dart';
import 'package:rizensoft_mobile_app_flutter/models/routes.dart';

class NavigationHelper{
  static final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();
  static Map<String, WidgetBuilder> allNavigationRoutes({
    required Map<String, WidgetBuilder>? appRoutes,
    Map<String, Widget>? mainHomeRoutes,
  }) {

    var allRoutes = <String, WidgetBuilder>{};

    allRoutes.addAll(Routes.routes);

    if (appRoutes != null) {
      for (var appRoute in appRoutes.entries) {
        allRoutes.removeWhere((key, value) => key == appRoute.key);
      }

      allRoutes.addAll(appRoutes);
    }

    return allRoutes;
  }

  static final List<String> _navigationRoutesList = List.empty(growable: true);

  static String getAndSetInitialRoute() {

    try {
      
      _navigationRoutesList.add(PackageRoutes.login.path);
      
      return PackageRoutes.login.path;
    } on Exception catch (e) {
      print(e.toString());
    }
    return '';
  }

  static Future<Object?> navigateTo({
    required String route,
    Object? arguments,
    bool popToRouteIfExists = true,
  }) async {
    if (_navigationRoutesList.contains(route) && popToRouteIfExists) {
      popToScreen(route: route, arguments: arguments);
      return Future(() => {});
    } else {
      _navigationRoutesList.add(route);
      return await globalNavigatorKey.currentState?.pushNamed(route, arguments: arguments);
    }
  }

  static Future<Object?> navigateToAndReplaceCurrent({
    required String route,
    Object? arguments,
  }) async {
    if (_navigationRoutesList.isNotEmpty) {
      _navigationRoutesList.removeLast();
    }

    _navigationRoutesList.add(route);
    return await globalNavigatorKey.currentState?.pushReplacementNamed(route, arguments: arguments);
  }

  static Future<Object?> navigateToAndClearStack({
    required String route,
    Object? arguments,
  }) async {
    _navigationRoutesList.clear();
    _navigationRoutesList.add(route);
    return await globalNavigatorKey.currentState
        ?.pushNamedAndRemoveUntil(route, (route) => false, arguments: arguments);
  }

  static void popToScreen({
    required String route,
    Object? arguments,
  }) {
    if (_navigationRoutesList.contains(route)) {
      var indexOfRouteToRemove = _navigationRoutesList.indexOf(route) + 1;
      var lengthOfList = _navigationRoutesList.length;

      if (indexOfRouteToRemove < lengthOfList) {
        _navigationRoutesList.removeRange(indexOfRouteToRemove, lengthOfList);
      }

      globalNavigatorKey.currentState?.popUntil(ModalRoute.withName(route));
    } else {
      print('Tried to pop back to a route that does not exist!');
    }
  }

  static void pop([Object? result]) {
    if (_navigationRoutesList.isNotEmpty) {
      _navigationRoutesList.removeLast();
    }
    return globalNavigatorKey.currentState?.pop(result);
  }
}