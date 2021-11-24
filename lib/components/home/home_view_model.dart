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
  int _lgtm = 0;
  int get lgtm => _lgtm;
  String _title = '';
  String get title => _title;
  String _url = '';
  String get url => _url;
  String _imageUrl = '';
  String get imageUrl => _imageUrl;

  Future<void> initialize() async {
    await _getAccountInfo();
    await _getItemsQiita();
  }

  Future<void> _getAccountInfo() async {
    await Firebase.initializeApp();
    //
    final snapshot = await FirebaseFirestore.instance //
        .collection(FirebaseConst().storeAccountConId) //
        .doc(FirebaseConst().storeAccountDocId) //
        .get();
    //
    final data = snapshot.data()!;
    debugLog('data: $data', 'ACCOUNT');
    AccountStore().setData(data);
  }

  /// get Items from Qiita.
  Future<void> _getItemsQiita() async {
    final request = HttpRequest();
    final uri = Uri.parse('${SnsConst().qiitaUrl}${SnsConst().getItemsUrl}');
    final headers = <String, String>{
      'content-type': 'application/json',
      'Authorization': 'Bearer ${AccountStore().qiita.token}',
    };
    final res = await request.get(uri, headers) as String;
    debugLog('body: $res', logName);

    final list = jsonDecode(res) as List<dynamic>;
    final model = QiitaItemsModel.fromJson(list[0]);
    _lgtm = model.lgtm;
    _title = model.title;
    _url = model.url;
    _imageUrl = model.imageUrl;
    notifyListeners();
  }
}
