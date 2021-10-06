import '../importer.dart';

enum RadioValue { FIRST, SECOND, THIRD }

class LocaleViewModel extends ChangeNotifier {
  RadioValue _gValue = RadioValue.SECOND;
  RadioValue get gValue => _gValue;
  //
  set gValue(RadioValue value) {
    _gValue = value;
  }
}
