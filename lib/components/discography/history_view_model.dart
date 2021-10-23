import '../importer.dart';

/// ViewModel for the HistoryScreen.
class HistoryViewModel extends ChangeNotifier {
  ///
  List<Map<String, dynamic>> _history = <Map<String, dynamic>>[];
  //List<HistoryModel> _history = [];
  List<Map<String, dynamic>> get history => _history;
  List<HistoryModel> histories = [];

  /// Get user History from FireStore.
  Future<void> getHistory() async {
    await Firebase.initializeApp();
    //
    final snapshot = await FirebaseFirestore.instance //
        .collection(FirebaseConst().storeHistoryConId) //
        .doc(FirebaseConst().storeHistoryDocId) //
        .get();
    //
    final data = snapshot.data()!;
    debugLog('data: $data', 'history');
    _history = data['history'] //
        .cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
    //
    histories.clear();
    //
    for (final company in _history) {
      final _careers = company['career'] //
          .cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
      final _cmodels = <CareerModel>[];
      //
      for (final _career in _careers) {
        final _cmodel = CareerModel(
          _career['from'].toString(),
          _career['overview'].toString(),
          _career['position'].toString(),
          _career['skills'].cast<String>() as List<String>,
          _career['to'].toString(),
        );
        _cmodels.add(_cmodel);
      }
      debugLog('cmodels: ${_cmodels.length.toString()}', 'history');
      //
      final _model = HistoryModel(
        _cmodels,
        company['name'].toString(),
        company['order'].toString(),
      );
      histories.add(_model);
    }
    debugLog('histories: ${histories.length.toString()}', 'history');
    notifyListeners();
  }
}
