import '../importer.dart';

/// ViewModel for the HomeScreen.
class HomeViewModel with ChangeNotifier {
  final String logName = 'HOME';

  // index
  int _selectedIndex = 0;
  int get currentIndex => _selectedIndex;
  set currentIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  /// on Item Tapped.
  void onItemTapped(int index, PageController pageController) {
    // setting animation page.
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    notifyListeners();
  }

  /// on Page Changed.
  void onPageChanged(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  /// got Info for Topix.
  String _title = "";
  String get title => _title;
  String _url = "";
  String get url => _url;
  String _imageUrl = "";
  String get imageUrl => _imageUrl;

  /// get Items from Qiita.
  Future<void> getItemsQiita() async {
    HttpRequest request = HttpRequest();
    var res = await request.get('/authenticated_user/items?page=1&per_page=1'); // todo
    debugLog('body: $res', logName);
    List<dynamic> resJson = json.decode(res);
    this._title = resJson[0]['title'];
    this._url = resJson[0]['url'];
    this._imageUrl = resJson[0]['profile_image_url'];
    notifyListeners();
  }

  /* -------------------------------------------------
                          Trash
     ------------------------------------------------- */

  //
  String userId = '';
  String token = '';
  //
  var _sns = SNSInfoStore();
  SNSInfoStore get info => _sns;
  //
  int get addedCount => _sns.list.length;

  /// Get the specified SNS from the list.
  SNSModel getSns(int index) {
    return _sns.list[index];
  }

  /// Check if the specified SNS has already been added.
  bool isAddedSns(String initial) {
    var result = false;
    _sns.list.forEach((sns) => {
          if (sns.initial == initial) {result = true}
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
