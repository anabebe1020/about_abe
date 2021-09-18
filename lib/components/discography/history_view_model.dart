import 'dart:ffi';

import '../importer.dart';

/// ViewModel for the HistoryScreen.
class HistoryViewModel extends ChangeNotifier {
  ///
  String _lisName = '';
  String get lisName => _lisName;
  String _lisJob = '';
  String get lisJob => _lisJob;
  String _lisFrom = '';
  String get lisFrom => _lisFrom;
  String _lisTo = '';
  String get lisTo => _lisTo;
  List<dynamic> _lisSkills = [];
  List<dynamic> get lisSkills => _lisSkills;
  String _lisOverview = '';
  String get lisOverview => _lisOverview;
  Map _field = null;
  Map get field => _field;

  /// Get user History from FireStore.
  Future<void> getHistory() async {
    await Firebase.initializeApp();
    //
    final snapshot = await FirebaseFirestore.instance //
        .collection(FirebaseConst().storeHistoryConId) //
        .doc(FirebaseConst().storeHistoryDocId) //
        .get();
    //debugLog('docs: ${snapshot.data()}', '[discography]');
    _field = snapshot.data();
    debugLog('docs: $_field', '[discography]');
    //
    _field.forEach((company, value) {
      debugLog('$company $value', '[discography]');
    });

    //
    final lis = snapshot.data()['lis'];
    debugLog('number of lis: ${lis.length}', '[discography]');
    //
    _lisFrom = lis[0]['from'];
    _lisTo = lis[0]['to'];
    _lisJob = lis[0]['job'];
    _lisSkills = lis[0]['skills'];
    _lisOverview = lis[0]['overview'];
    //debugLog('lis from:$_lisFrom to:$_lisTo job:$_lisJob', '[discography]');
    notifyListeners();
  }

  void _createList() {
    // pageにて使用するListをここで生成する
  }
}

class DocModel {
  String from;
  String to;
  String job;
  Array skills;
  String overview;
}
