import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:realm/realm.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/realm_helper.dart';
import 'package:rizensoft_mobile_app_flutter/logic/viewmodels/login_viewmodel.dart';
import 'package:rizensoft_mobile_app_flutter/logic/viewmodels/viewmodel_provider.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/profile.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/refresh_token.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  createState() {
    return LoginViewState();
  }
}

class LoginViewState extends State<LoginView> {
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late Realm realm;
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  String? emailAddress = '';
  String? password = '';

  @override
  void initState() {
    super.initState();
    // realm =
    //     RealmHelper(Configuration.local([Profile.schema, RefreshToken.schema]))
    //         .realm!;
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    initialization();
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    realm.close();
    super.dispose();
  }

  void _requestEmailFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

  void _requestPasswordFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(passwordFocusNode);
    });
  }

  /// Outlines a text using shadows.
  static List<Shadow> outlinedText(
      {double strokeWidth = 2,
      Color strokeColor = Colors.black,
      int precision = 5}) {
    Set<Shadow> result = HashSet();
    for (int x = 1; x < strokeWidth + precision; x++) {
      for (int y = 1; y < strokeWidth + precision; y++) {
        double offsetX = x.toDouble();
        double offsetY = y.toDouble();
        result.add(Shadow(
            offset: Offset(-strokeWidth / offsetX, -strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(-strokeWidth / offsetX, strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(strokeWidth / offsetX, -strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(strokeWidth / offsetX, strokeWidth / offsetY),
            color: strokeColor));
      }
    }
    return result.toList();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return ViewModelProvider<LoginViewModel>(
      viewModelBuilder: () => LoginViewModel(context, emailAddress, password),
      builder: (context, vm, child) {
        emailController.text = emailAddress ?? '';
        passwordController.text = password ?? '';

        return Material(
            child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.orange],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(child: SizedBox(height: 40, width: 300)),
                _headerControls(vm),
                Expanded(child: SizedBox(height: 40, width: 300)),
                footerCoontrols(vm),
              ],
            ),
          ),
        ));
      },
    );
  }

  Widget _headerControls(LoginViewModel viewModel) {
    var loginImage = Image.asset(
      'assets/logo_transparent.png',
      width: 100,
      height: 100,
    );

    return Column(
      children: [
        loginImage,
        SizedBox(
          height: 40,
          width: 300,
          child: TextFormField(
            controller: emailController,
            focusNode: emailFocusNode,
            onTap: _requestEmailFocus,
            maxLines: 1,
            style: TextStyle(color: Colors.black),
            onChanged: (value) {
              setState(() {
                emailAddress = emailController.text;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty || !value.contains('@')) {
                return 'Please enter you email address';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              labelText: 'Email',
              labelStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  shadows: outlinedText(strokeColor: Colors.white)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
              hintText: 'Enter your email',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 300,
          height: 40,
          child: TextFormField(
            controller: passwordController,
            focusNode: passwordFocusNode,
            onTap: _requestPasswordFocus,
            maxLines: 1,
            style: TextStyle(color: Colors.black),
            obscureText: true,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              setState(() {
                password = passwordController.text;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              labelText: 'Password',
              labelStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  shadows: outlinedText(strokeColor: Colors.white)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
              hintText: 'Enter your password',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget footerCoontrols(LoginViewModel viewModel) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                if ((viewModel.emailAddress != null &&
                        viewModel.emailAddress!.isNotEmpty) ||
                    viewModel.password != null &&
                        viewModel.password!.isNotEmpty) {
                  await viewModel.login();
                }
              },
              child: const Text('Login'),
            ),
            SizedBox(
              width: 40,
              height: 20,
            ),
            //ElevatedButton(
            //onPressed: () {
            // Validate returns true if the form is valid, or false otherwise.
            //if (true) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.

            //}
            //},
            //child: const Text('Register'),
            //),
          ],
        ));
  }
}
