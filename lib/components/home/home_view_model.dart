import '../importer.dart';

typedef JsonMap = Map<String, dynamic>;

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
  String _title = '';
  String get title => _title;
  String _url = '';
  String get url => _url;
  String _imageUrl = '';
  String get imageUrl => _imageUrl;

  /// get Items from Qiita.
  Future<void> getItemsQiita() async {
    final request = HttpRequest();
    final uri = Uri.parse('${SnsConst().qiitaUrl}${SnsConst().getItemsUrl}');
    final headers = <String, String>{
      'content-type': 'application/json',
      'Authorization': 'Bearer 819ef4e03a5073fc5b72c2e75f277116a8fca0db',
    };
    final res = await request.get(uri, headers) as String;
    debugLog('body: $res', logName);

    final list = jsonDecode(res) as List<dynamic>;
    final model = QiitaItemsModel.fromJson(list[0]);
    _title = model.title;
    _url = model.url;
    _imageUrl = model.imageUrl;
    notifyListeners();
  }
}
