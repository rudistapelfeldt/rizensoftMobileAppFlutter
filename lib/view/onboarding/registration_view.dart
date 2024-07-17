import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_pw_validator/Utilities/Validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:realm/realm.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/app_constants.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/dialog_helper.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/realm_helper.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/styles.dart';
import 'package:rizensoft_mobile_app_flutter/logic/viewmodels/register_viewmodel.dart';
import 'package:rizensoft_mobile_app_flutter/logic/viewmodels/viewmodel_provider.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/address.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/profile.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/reminder.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:rsa_id_number/rsa_id_number.dart';

class RegistrationView extends StatefulWidget {
  RegistrationView({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  createState() {
    return RegistrationViewState();
  }
}

class RegistrationViewState extends State<RegistrationView> {
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;
  late FocusNode firstNameFocusNode;
  late FocusNode lastNameFocusNode;
  late FocusNode userNameFocusNode;
  late FocusNode dateOfBirthFocusNode;
  late FocusNode idNumberFocusNode;
  late FocusNode genderFocusNode;
  late Realm realm;
  final passwordRegex = RegExp(r'^[A-Za-z0-9_.]+$');
  TextEditingController firstNameController = TextEditingController(text: '');
  TextEditingController lastNameController = TextEditingController(text: '');
  TextEditingController userNameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController dobController = TextEditingController(text: '');
  TextEditingController idNumberController = TextEditingController(text: '');
  TextEditingController genderController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController confirmPasswordController =
      TextEditingController(text: '');
  Validator validator = Validator();
  static Profile? profile;
  static Address? address;
  late List<Address>? addresses = [];
  late List<Reminder>? reminders = [];
  String? emailAddress = '';
  String? password = '';
  FlutterPwValidator get passwordValidator => FlutterPwValidator(
        key: validatorKey,
        controller: passwordController,
        minLength: 6,
        uppercaseCharCount: 2,
        lowercaseCharCount: 2,
        numericCharCount: 3,
        specialCharCount: 1,
        width: 400,
        height: 150,
        onSuccess: () {
          profile!.password = passwordController.text;
          DialogHelper.showToast(
              'Password valid',
              Toast.LENGTH_LONG,
              ToastGravity.BOTTOM,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).textTheme.displaySmall!.fontSize!);
        },
        onFail: () {
          DialogHelper.showToast(
              'Password invalid',
              Toast.LENGTH_LONG,
              ToastGravity.BOTTOM,
              Theme.of(context).colorScheme.error,
              Theme.of(context).colorScheme.errorContainer,
              Theme.of(context).textTheme.displaySmall!.fontSize!);
        },
        strings: passwordValidator.strings,
      );

  @override
  void initState() {
    super.initState();
    realm = RealmHelper(
        context, Configuration.local([Address.schema, Reminder.schema, Profile.schema])).realm!;
    initialization();
  }

  @override
  void dispose() {
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    userNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    idNumberFocusNode.dispose();
    genderFocusNode.dispose();
    dateOfBirthFocusNode.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    idNumberController.dispose();
    genderController.dispose();
    dobController.dispose();
    realm.close();
    super.dispose();
  }

  void _requestLastNameFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(lastNameFocusNode);
    });
  }

  void _requestFirstNameFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(firstNameFocusNode);
    });
  }

  void _requestPasswordFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(passwordFocusNode);
    });
  }

  void _requestUserNameFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(userNameFocusNode);
    });
  }

  void _requestEmailFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

  void _requestConfirmPasswordFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
    });
  }

  void _requestIdNumberFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(idNumberFocusNode);
    });
  }

  void _requestGenderFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(genderFocusNode);
    });
  }

  DateTime subtractYears(int years) {
    return DateTime.now().copyWith(year: years);
  }

  void _requestDateOfBirthFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(dateOfBirthFocusNode);
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
    profile = ProfileJ.instance;
    address = $Address.instance;
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
    
    return ViewModelProvider<RegisterViewModel>(
      viewModelBuilder: () => RegisterViewModel(context, address: address, profile: profile),
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
                _headerControls(vm, context),
                Expanded(child: SizedBox(height: 40, width: 300)),
                footerCoontrols(vm, context),
              ],
            ),
          ),
        ));
      },
    );
  }

  Widget _headerControls(
      RegisterViewModel viewModel, BuildContext context) {
    var registerImage = Image.asset(
      'assets/logo_transparent.png',
      width: 100,
      height: 100,
    );

    return Column(
      children: [
        registerImage,
        SizedBox(
          height: Styles.INPUT_HEIGHT,
          width: Styles.INPUT_WIDTH,
          child: TextFormField(
            controller: firstNameController,
            focusNode: firstNameFocusNode,
            onTap: _requestFirstNameFocus,
            maxLines: 1,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            onChanged: (value) {
              setState(() {
                viewModel.profile!.firstName = firstNameController.text;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter you first name';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              isDense: true,
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              labelText: 'First name',
              labelStyle: TextStyle(
                  fontSize: AppConstants.fontSize.body,
                  color: Colors.black,
                  shadows: outlinedText(strokeColor: Colors.white)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
              hintText: 'Frist name',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: Styles.INPUT_HEIGHT,
          width: Styles.INPUT_WIDTH,
          child: TextFormField(
            controller: lastNameController,
            focusNode: lastNameFocusNode,
            onTap: _requestLastNameFocus,
            maxLines: 1,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            onChanged: (value) {
              setState(() {
                viewModel.profile!.lastName = lastNameController.text;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter you last name';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              isDense: true,
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              labelText: 'Last nmae',
              labelStyle: TextStyle(
                  fontSize: AppConstants.fontSize.body,
                  color: Theme.of(context).colorScheme.secondary,
                  shadows: outlinedText(strokeColor: Colors.white)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
              hintText: 'Enter your last name',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: Styles.INPUT_HEIGHT,
          width: Styles.INPUT_WIDTH,
          child: TextFormField(
            controller: userNameController,
            focusNode: userNameFocusNode,
            onTap: _requestUserNameFocus,
            maxLines: 1,
            style: TextStyle(color: Colors.black),
            obscureText: true,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              setState(() {
                viewModel.profile!.userName = userNameController.text;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your user name';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              labelText: 'User name',
              labelStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  shadows: outlinedText(strokeColor: Colors.white)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
              hintText: 'Enter your user name',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: Styles.INPUT_HEIGHT,
          width: Styles.INPUT_WIDTH,
          child: TextFormField(
            controller: emailController,
            focusNode: emailFocusNode,
            onTap: _requestEmailFocus,
            maxLines: 1,
            style: TextStyle(color: Colors.black),
            obscureText: true,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              setState(() {
                viewModel.profile!.emailAddress = emailController.text;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty || !value.contains('@')) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              labelText: 'Email address',
              labelStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  shadows: outlinedText(strokeColor: Colors.white)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
              hintText: 'Enter your email address',
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
          child: Column(children: [
            TextField(
                onTap: _requestDateOfBirthFocus,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Date of birth',
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      shadows: outlinedText(strokeColor: Colors.white)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  hintText: 'Select date of birth',
                  hintStyle: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 20,
            ),
            CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: subtractYears(-100),
                lastDate: DateTime.now(),
                onDateChanged: (value) => {
                      viewModel.profile!.dateOfBirth = value.toString(),
                    }),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              focusNode: passwordFocusNode,
              onTap: _requestPasswordFocus,
              maxLines: 1,
              style: TextStyle(color: Colors.black),
              obscureText: true,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  viewModel.profile!.password = value;
                });
              },
              validator: (String? value) {
                if (validator.hasMinLength(value!, 10)) {
                  return passwordValidator.strings!.atLeast;
                }
                if (validator.hasMinUppercase(value, 3)) {
                  return passwordValidator.strings!.uppercaseLetters;
                }
                if (validator.hasMinSpecialChar(value, 1)) {
                  return passwordValidator.strings!.specialCharacters;
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
                    fontSize: AppConstants.fontSize.body,
                    color: Theme.of(context).colorScheme.secondary,
                    shadows: outlinedText(strokeColor: Colors.white)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                hintText: 'Enter your password',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            passwordValidator,
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: confirmPasswordController,
              focusNode: confirmPasswordFocusNode,
              onTap: _requestConfirmPasswordFocus,
              maxLines: 1,
              style: TextStyle(color: Colors.black),
              obscureText: true,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  viewModel.profile!.confirmPassword = value;
                });
              },
              validator: (String? value) {
                if (value! != viewModel.profile!.password!) {
                  return AppConstants.profileText.passwordsDoNotMatch;
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                labelText: 'Confirm password',
                labelStyle: TextStyle(
                    fontSize: AppConstants.fontSize.body,
                    color: Colors.black,
                    shadows: outlinedText(strokeColor: Colors.white)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                hintText: 'Confirm password',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: idNumberController,
              focusNode: idNumberFocusNode,
              onTap: _requestIdNumberFocus,
              maxLines: 1,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  viewModel.profile!.idNumber = value;
                });
              },
              validator: (String? value) {
                if (!RsaIdValidator.isValid(value!))
                  return AppConstants.profileText.invalidIdNumber;
                return null;
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                labelText: 'ID Number',
                labelStyle: TextStyle(
                    fontSize: AppConstants.fontSize.body,
                    color: Colors.black,
                    shadows: outlinedText(strokeColor: Colors.white)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                hintText: 'ID Number',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton(
              borderRadius: BorderRadius.all(Radius.circular(AppConstants.dimensions.borderRadius)),
              padding: EdgeInsets.all(AppConstants.dimensions.inputPadding),
              onTap: _requestGenderFocus,
              dropdownColor: Theme.of(context).colorScheme.tertiary,
              focusColor: Theme.of(context).colorScheme.onTertiaryContainer,
              hint: Text('Please choose a gender'),
              value: viewModel.profile?.gender,
              onChanged: (newValue) {
                setState(() {
                  viewModel.profile?.gender = newValue;
                });
              },
              items: AppConstants.registerTexts.GENDERS.map((gender) {
                return DropdownMenuItem(
                  child: new Text(gender),
                  value: gender,
                );
              }).toList(),
            ),
          ]),
        ),
      ],
    );
  }

  Widget footerCoontrols(
      RegisterViewModel viewModel, BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async => await viewModel.register(),
              child: const Text('Register'),
            ),
          ],
        ));
  }
}
