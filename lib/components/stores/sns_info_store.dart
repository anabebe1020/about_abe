import '../importer.dart';

/// Data store for SNS info.
class SNSInfoStore {
  static final SNSInfoStore _cache = SNSInfoStore._internal();
  static List<SNSModel> _list = [];
  List<SNSModel> get list => _list;

  SNSInfoStore._internal();

  /// Singleton design pattern.
  factory SNSInfoStore() {
    return _cache;
  }

  /// Check if the specified SNS has already been added.
  bool isAdded(String initial) {
    _list.forEach((sns) {
      if(sns.initial == initial){
        return true;
      }
    });
    return false;
  }

  /// Add Qiita to SNS list.
  void addQiita(String userId, String token) {
    var sns = new SNSModel();
    sns.initial = SnsConst().qiita;
    sns.color = StyleConst().qiitaButtonColor;
    sns.userId = userId;
    sns.secret = token;
    _list.add(sns);
  }

  /// Add Sample to SNS list.
  void addSample() {
    var sns = new SNSModel();
    sns.initial = 'Sample';
    sns.color = StyleConst().sampleButtonColor;
    sns.userId = 'SampleID';
    sns.secret = 'password';
    _list.add(sns);
  }

  /// Clean of SNS list.
  void cleanSns() {
    _list = [];
  }
}

/// Model for SNS.
class SNSModel {
  String initial;
  Color color;
  String userId;
  String secret;
}
