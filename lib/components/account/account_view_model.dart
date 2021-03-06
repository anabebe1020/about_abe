import '../importer.dart';

/// ViewModel for the QiitaScreen.
class AccountViewModel extends ChangeNotifier {
  final _github = GitHubModel();
  final _repos = <GitHubRepoModel>[];
  final _qiita = QiitaModel();
  GitHubModel get github => _github;
  List<GitHubRepoModel> get repos => _repos;
  QiitaModel get qiita => _qiita;

  Future<void> initialize() async {
    await getQiitaUserInfo();
    await getGithubUserInfo();
    await getGithubMyRepos();
    //debugLog('length:${_repos.length}', 'REPOS');
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
    debugLog('Qiita User Info: $res', 'ACOUNT');
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
    final uri = Uri.parse('${SnsConst().ghApiUrl}/users/${AccountStore().github.name}');
    final headers = <String, String>{
      'content-type': 'application/json',
    };
    final res = await request.get(uri, headers) as String;
    debugLog('GitHub User Info: $res', 'ACOUNT');
    final resJson = json.decode(res) as Map<String, dynamic>;
    _github
      ..iconUrl = resJson['avatar_url'] as String
      ..userId = resJson['login'] as String
      ..name = resJson['name'] as String
      ..description = resJson['bio'] as String
      ..company = resJson['company'] as String
      ..location = resJson['location'] as String
      ..link = resJson['blog'] as String
      ..twitter = resJson['twitter_username'] as String
      ..followees = resJson['following'] as int
      ..followers = resJson['followers'] as int
      ..items = resJson['public_repos'] as int;
    notifyListeners();
  }

  /// Get user information from QiitaAPI.
  Future<void> getGithubMyRepos() async {
    final request = HttpRequest();
    final uri = Uri.parse('${SnsConst().ghApiUrl}/users/${AccountStore().github.name}/repos');
    final headers = <String, String>{
      'content-type': 'application/json',
    };
    final res = await request.get(uri, headers) as String;
    debugLog('GitHub Repos: $res', 'ACOUNT');
    final resList = json
        .decode(res) //
        .cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
    // clear the repository array.
    _repos.clear();
    // adding the repository array.
    for (final res in resList) {
      final _repo = GitHubRepoModel()
        ..name = res['name'] as String
        ..stars = res['stargazers_count'] as int
        ..url = res['svn_url'] as String
        ..language = res['language'] as String;
      _repos.add(_repo);
    }
    notifyListeners();
  }
}
