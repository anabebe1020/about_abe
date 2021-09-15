import '../importer.dart';

/// ViewModel for the HistoryScreen.
class HistoryViewModel extends ChangeNotifier {
  ///
  //String _iconUrl = '';
  //String get iconUrl => _iconUrl;

  /// Get user Historyy from FireStore.
  Future<void> getHistory() async {
    //
    final document = await FirebaseFirestore.instance //
        .collection(FirebaseConst().storeHistoryConId) //
        .doc(FirebaseConst().storeHistoryDocId) //
        .get();
    debugLog('docs: $document', 'discography');
    notifyListeners();
  }
}
