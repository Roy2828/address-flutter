import 'package:json_annotation/json_annotation.dart';

part 'address_common_entity.g.dart';

@JsonSerializable()
class AddressCommonEntity {
  String? name;
  String? code;
  String? provinceCode;
  String? cityCode;
  String? areaCode;
  String? streetCode;

  AddressCommonEntity(this.name, this.code, this.provinceCode, this.cityCode,
      this.areaCode, this.streetCode);

  factory AddressCommonEntity.fromJson(Map<String, dynamic> json) =>
      _$AddressCommonEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AddressCommonEntityToJson(this);
}
