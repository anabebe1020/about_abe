/// model class and datastore of account from firestore.

class AccountStore {
  factory AccountStore() {
    return _cache;
  }
  AccountStore._internal();
  //
  static final AccountStore _cache = AccountStore._internal();
  //static final model = AccountModel();
  final github = GithubAccount();
  final qiita = QiitaAccount();
  void setData(Map<String, dynamic> data) {
    github.name = data['github']['name'].toString();
    qiita
      ..name = data['qiita']['name'].toString()
      ..token = data['qiita']['token'].toString();
  }
}

class GithubAccount {
  String name = '';
}

class QiitaAccount {
  String name = '';
  String token = '';
}
