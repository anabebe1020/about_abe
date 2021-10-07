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
  String _title = '';
  String get title => _title;
  String _url = '';
  String get url => _url;
  String _imageUrl = '';
  String get imageUrl => _imageUrl;

  /// get Items from Qiita.
  Future<void> getItemsQiita() async {
    final request = HttpRequest();
    final res = await request.get('/authenticated_user/items?page=1&per_page=1') as String; // todo
    debugLog('body: $res', logName);
    final resJson = json.decode(res) as List<dynamic>;
    _title = resJson[0]['title'] as String;
    _url = resJson[0]['url'] as String;
    _imageUrl = resJson[0]['profile_image_url'] as String;
    notifyListeners();
  }
}
