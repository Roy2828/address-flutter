// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_common_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressCommonEntity _$AddressCommonEntityFromJson(Map<String, dynamic> json) =>
    AddressCommonEntity(
      json['name'] as String?,
      const StringConverter().fromJson(json['code']),
      json['provinceCode'] as String?,
      json['cityCode'] as String?,
      json['areaCode'] as String?,
      json['streetCode'] as String?,
    );

Map<String, dynamic> _$AddressCommonEntityToJson(
        AddressCommonEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': const StringConverter().toJson(instance.code),
      'provinceCode': instance.provinceCode,
      'cityCode': instance.cityCode,
      'areaCode': instance.areaCode,
      'streetCode': instance.streetCode,
    };
