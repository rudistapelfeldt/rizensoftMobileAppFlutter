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

  // $Address toRealmObject() => instance.toRealmObject();

  Address toRealmObject($Address address) {
    return Address(
      address.addressId,
      address.addressName,
      address.addressLine1,
      address.addressLine2!,
      address.suburb,
      address.city,
      address.province,
      address.country,
    );
  }
  static $Address fromJson(Map<String, dynamic> json) => _$$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$$AddressToJson(this);
}