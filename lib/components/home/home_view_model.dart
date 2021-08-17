import '../importer.dart';

/// ViewModel for the HomeScreen.
class HomeViewModel with ChangeNotifier {
  String userId = '';
  String token = '';
  final String logName = '[HOME]';
  var _sns = SNSInfoStore();
  //
  int get addedCount => _sns.list.length;
  SNSInfoStore get info => _sns;

  /// Get the specified SNS from the list.
  SNSModel getSns(int index) {
    return _sns.list[index];
  }

  /// Check if the specified SNS has already been added.
  bool isAddedSns(String initial) {
    var result = false;
    _sns.list.forEach((sns) => {
      if (sns.initial == initial) {
        result = true
      }
    });
    debugLog('result: ${result.toString()}', logName);
    return result;
  }

  /// Add Qiita to SNS list.
  void addQiita() {
    _sns.addQiita(userId, token);
    debugLog('sns: ' + _sns.list[addedCount - 1].initial.toString(), logName);
    notifyListeners();
  }

  /// Add Sample to SNS list.
  void addSample() {
    _sns.addSample();
    debugLog('sns: ' + _sns.list[addedCount - 1].initial.toString(), logName);
    notifyListeners();
  }

  /// Clean of SNS list.
  void cleanSns() {
    _sns.cleanSns();
    notifyListeners();
  }
}
