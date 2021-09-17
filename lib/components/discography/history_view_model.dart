import '../importer.dart';

/// ViewModel for the HistoryScreen.
class HistoryViewModel extends ChangeNotifier {
  ///
  //String _iconUrl = '';
  //String get iconUrl => _iconUrl;

  /// Get user History from FireStore.
  Future<void> getHistory() async {
    await Firebase.initializeApp();
    //
    final snapshot = await FirebaseFirestore.instance //
        .collection(FirebaseConst().storeHistoryConId) //
        .doc(FirebaseConst().storeHistoryDocId) //
        .get();
    debugLog('docs: ${snapshot.data()}', '[discography]');
    notifyListeners();
  }
}
