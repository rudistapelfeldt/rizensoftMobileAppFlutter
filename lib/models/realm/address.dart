import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

part 'address.g.dart';
part 'address.realm.dart';

@RealmModel(ObjectType.embeddedObject)
@JsonSerializable(createToJson: true)
class $Address {

  static Address get instance=> Address._();
  late String addressId;

  late String addressName;

  late String addressLine1;

  late String? addressLine2;

  late String suburb;

  late String city;

  late String province;

  late String country;

  late String postalCode;

  $Address toRealmObject() => instance.toRealmObject();

  // Address fromJson(Map<String, dynamic> json) {
  //   return Address(
  //     addressId = json['addressId'],
  //     addressName = json['addressName'],
  //     addressId = json['addressId'],
  //     addressLine1 = json['addressLine1'],
  //     addressLine2 = json['address?Line2'],
  //     suburb = json['suburb'],
  //     city= json['addressId'],
  //     province = json['province'],
  //     country = json['country'],
  //   );
  // }
  static $Address fromJson(Map<String, dynamic> json) => _$$AddressFromJson(json).toRealmObject();
  Map<String, dynamic> toJson() => _$$AddressToJson(this);
}