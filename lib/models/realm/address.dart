
import 'package:realm/realm.dart';

part 'address.realm.dart';

@RealmModel()
class $Address{
  @PrimaryKey()
  late int id;

  late String? addressId;

  late String? addressName;

  late String addressLine1;

  late String addressLine2;

  late String suburb;

  late String city;

  late String province;

  late String country;

  late String postalCode;
}