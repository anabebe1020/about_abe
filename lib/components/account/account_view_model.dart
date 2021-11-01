import '../importer.dart';

/// ViewModel for the QiitaScreen.
class AccountViewModel extends ChangeNotifier {
  final _github = GitHubModel();
  final _qiita = QiitaModel();
  GitHubModel get github => _github;
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
    _github
      ..iconUrl = resJson['avatar_url'] as String
      ..userId = '@${resJson['login'] as String}'
      ..name = resJson['name'] as String
      ..description = resJson['bio'] as String
      ..company = resJson['company'] as String
      ..location = resJson['location'] as String
      ..link = resJson['blog'] as String
      ..followees = resJson['following'] as int
      ..followers = resJson['followers'] as int
      ..items = resJson['public_repos'] as int;
    notifyListeners();
  }
}
