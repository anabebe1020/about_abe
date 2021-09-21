import '../importer.dart';

/// ViewModel for the HistoryScreen.
class HistoryViewModel extends ChangeNotifier {
  ///
  Map<String, dynamic> _history = {};
  Map<String, dynamic> get history => _history;

  /// Get user History from FireStore.
  Future<void> getHistory() async {
    await Firebase.initializeApp();
    //
    final snapshot = await FirebaseFirestore.instance //
        .collection(FirebaseConst().storeHistoryConId) //
        .doc(FirebaseConst().storeHistoryDocId) //
        .get();
    await HistoryStore.createList(snapshot.data());
    _history = HistoryStore.history;
    //debugLog('history: $history', '[discography]');
    //
    debugLog('number of company: ${history.length}', '[discography]');
    debugLog('number of lis: ${history['lis'].length}', '[discography]');
    debugLog('keys of history: ${history.keys}', '[discography]');
    debugLog('skills of lis: ${history['lis'][0]['skills']}', '[discography]');
    //
    notifyListeners();
  }
}
