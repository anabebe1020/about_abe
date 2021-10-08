import '../importer.dart';

enum RadioValue { first, second, third }

class LocaleViewModel extends ChangeNotifier {
  RadioValue? gValue = RadioValue.second;
}
