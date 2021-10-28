import '../importer.dart';

/// ViewModel for the QiitaScreen.
class QiitaViewModel extends ChangeNotifier {
  String _iconUrl = '';
  String get iconUrl => _iconUrl;
  String _userId = '';
  String get userId => _userId;
  String _description = '';
  String get description => _description;
  int _followees = 0;
  int get followees => _followees;
  int _followers = 0;
  int get followers => _followers;
  int _items = 0;
  int get items => _items;

  /// Get user information from QiitaAPI.
  Future<void> getUserInfo(String userId) async {
    final request = HttpRequest();
    final uri = Uri.parse('${SnsConst().qiitaUrl}/users/$userId');
    final headers = <String, String>{
      'content-type': 'application/json',
      'Authorization': 'Bearer 819ef4e03a5073fc5b72c2e75f277116a8fca0db',
    };
    final res = await request.get(uri, headers) as String;
    //print('body: $res');
    final resJson = json.decode(res) as Map<String, dynamic>;
    _iconUrl = resJson['profile_image_url'] as String;
    _userId = '@${resJson['id'] as String}';
    _description = resJson['description'] as String;
    _followees = resJson['followees_count'] as int;
    _followers = resJson['followers_count'] as int;
    _items = resJson['items_count'] as int;
    notifyListeners();
  }
}
