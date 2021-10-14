import '../importer.dart';

/// ViewModel for the HistoryScreen.
class HistoryViewModel extends ChangeNotifier {
  ///
  List<dynamic> _history = <dynamic>[];
  List<dynamic> get history => _history;

  /// Get user History from FireStore.
  Future<void> getHistory() async {
    await Firebase.initializeApp();
    //
    final snapshot = await FirebaseFirestore.instance //
        .collection(FirebaseConst().storeHistoryConId) //
        .doc(FirebaseConst().storeHistoryDocId) //
        .get();
    _history = snapshot.data()?['history'].cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
    notifyListeners();
  }
}
