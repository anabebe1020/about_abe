import '../importer.dart';

class HistoryStore {
  static Map<String, dynamic> _history = {};
  static Map<String, dynamic> get history => _history;
  //
  static Future<void> createList(Map<String, dynamic> fields) async {
    // pageにて使用するListをここで生成する
    fields.forEach((name, value) {
      debugLog('company name: $name', 'HISTORY');
      _history[name] = value;
      //CompanyModel company = value;
      //value.forEach((career) {
      //  debugLog('$career', '[discography]');
      //});
    });
  }
}

class CompanyModel {
  List<CareerModel> company;
}

class CareerModel {
  String from;
  String to;
  String job;
  List<String> skills;
  String overview;
}
