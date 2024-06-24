import 'package:rizensoft_mobile_app_flutter/models/realm/address.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/profile.dart';

class RegisterRequest{
  late Profile profile;

  late Address address;

  RegisterRequest(this.address, this.profile);
}