import 'package:city_picker_example/db/test/json_converter/int_to_string_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_common_entity.g.dart';

@JsonSerializable()
class AddressCommonEntity {
  String? name;
  @StringConverter()
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
