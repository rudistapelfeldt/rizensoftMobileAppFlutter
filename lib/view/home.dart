import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/app_constants.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/navigation_helper.dart';

class Home extends StatefulWidget {
  final Map<String, WidgetBuilder>? appRoutes;
  Home(this.appRoutes, {super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NavigationHelper.getAndSetInitialRoute(),
      navigatorKey: NavigationHelper.globalNavigatorKey,
      routes: NavigationHelper.allNavigationRoutes(appRoutes: widget.appRoutes),
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        
        overscroll: false,
      ),
      title: AppConstants.APP_TITLE,
      theme: ThemeData(
        useMaterial3: true,
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          background: Colors.white,
          primary: Colors.blueAccent,
          secondary: Colors.black,
          tertiary: Colors.blueGrey,
          error: Colors.redAccent,
          errorContainer: Colors.lightBlue,
          outline: Colors.blueGrey,
          shadow: Colors.grey,
          seedColor: Colors.purple,
          // TRY THIS: Change to "Brightness.light"
          //           and see that all colors change
          //           to better contrast a light background.
          brightness: Brightness.dark,
        ),

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          // TRY THIS: Change one of the GoogleFonts
          //           to "lato", "poppins", or "lora".
          //           The title uses "titleLarge"
          //           and the middle text uses "bodyMedium".
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).colorScheme.secondary,
          ),
          bodyMedium: GoogleFonts.merriweather(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            color: Theme.of(context).colorScheme.secondary,
          ),
          displaySmall: GoogleFonts.pacifico(
            fontSize: 8,
            fontStyle: FontStyle.normal,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
