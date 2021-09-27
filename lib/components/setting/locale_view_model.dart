import '../importer.dart';

enum RadioValue { FIRST, SECOND, THIRD }

class LocaleViewModel extends ChangeNotifier {
  RadioValue _gValue = RadioValue.FIRST;
  RadioValue get gValue => _gValue;
  //
  onRadioSelected(value) {
    _gValue = value;
  }
}
