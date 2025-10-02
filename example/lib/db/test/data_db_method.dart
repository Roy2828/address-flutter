

abstract class DataDBMethod {

  String tableName();

  Future<List<Map<String, dynamic>>?> queryProvince();

  Future<List<Map<String, dynamic>>?> queryCity(String provinceCode);

  Future<List<Map<String, dynamic>>?> queryArea(String cityCode);

  Future<List<Map<String, dynamic>>?> queryStreet(String areaCode);

}