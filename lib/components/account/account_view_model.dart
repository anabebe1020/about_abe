import '../importer.dart';

/// ViewModel for the QiitaScreen.
class AccountViewModel extends ChangeNotifier {
  final _qiita = QiitaModel();
  QiitaModel get qiita => _qiita;

  Future<void> initialize() async {
    await getQiitaUserInfo();
    await getGithubUserInfo();
  }

  /// Get user information from QiitaAPI.
  Future<void> getQiitaUserInfo() async {
    final request = HttpRequest();
    final uri = Uri.parse('${SnsConst().qiitaUrl}/users/${AccountStore().qiita.name}');
    final headers = <String, String>{
      'content-type': 'application/json',
      'Authorization': 'Bearer ${AccountStore().qiita.token}',
    };
    final res = await request.get(uri, headers) as String;
    //print('body: $res');
    final resJson = json.decode(res) as Map<String, dynamic>;
    _qiita
      ..iconUrl = resJson['profile_image_url'] as String
      ..userId = '@${resJson['id'] as String}'
      ..description = resJson['description'] as String
      ..followees = resJson['followees_count'] as int
      ..followers = resJson['followers_count'] as int
      ..items = resJson['items_count'] as int;
    notifyListeners();
  }

  /// Get user information from QiitaAPI.
  Future<void> getGithubUserInfo() async {
    final request = HttpRequest();
    final uri = Uri.parse('${SnsConst().githubUrl}/users/${AccountStore().github.name}');
    final headers = <String, String>{
      'content-type': 'application/json',
    };
    final res = await request.get(uri, headers) as String;
    debugLog('body: $res', 'GITHUB');
    final resJson = json.decode(res) as Map<String, dynamic>;
    //_iconUrl = resJson['profile_image_url'] as String;
    //_userId = '@${resJson['id'] as String}';
    //_description = resJson['description'] as String;
    //_followees = resJson['followees_count'] as int;
    //_followers = resJson['followers_count'] as int;
    //_items = resJson['items_count'] as int;
    notifyListeners();
  }
}
