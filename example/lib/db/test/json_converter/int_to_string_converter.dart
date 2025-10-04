

import 'package:json_annotation/json_annotation.dart';


class StringConverter implements JsonConverter<String?, dynamic> {
  const StringConverter();

  @override
  String? fromJson(dynamic json) {
    return json?.toString();
  }

  @override
  dynamic toJson(String? object) => object;
}