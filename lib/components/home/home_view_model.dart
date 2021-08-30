import '../importer.dart';

/// ViewModel for the HomeScreen.
class HomeViewModel with ChangeNotifier {
  final String logName = '[HOME]';

  // index
  int _selectedIndex = 0;
  int get currentIndex => _selectedIndex;
  set currentIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  ///
  void onItemTapped(int index, PageController pageController) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    notifyListeners();
  }

  ///
  void onPageChanged(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  ///
  String _title = "";
  String _url = "";
  String _imageUrl = "";

  ///
  Future<void> getItemsQiita(String userId) async {
    HttpRequest request = HttpRequest();
    var res = await request.get('/authenticated_user/items?page=1&per_page=1'); // todo
    debugLog('body: $res', logName);
    Map<String, dynamic> resJson = json.decode(res);
    this._title = resJson['title'];
    this._url = resJson['url'];
    this._imageUrl = resJson['profile_image_url'];
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
