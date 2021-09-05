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
    HttpRequest request = HttpRequest();
    var res = await request.get('/users/$userId'); // todo
    print('body: $res');
    Map<String, dynamic> resJson = json.decode(res);
    this._iconUrl = resJson['profile_image_url'];
    this._userId = '@' + resJson['id'];
    this._description = resJson['description'];
    this._followees = resJson['followees_count'];
    this._followers = resJson['followers_count'];
    this._items = resJson['items_count'];
    notifyListeners();
  }
}
