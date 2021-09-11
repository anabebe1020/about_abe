import '../importer.dart';

/// State of fix theme.
class AppTheme extends ChangeNotifier {
  bool isDark = false;
  // theme light.
  ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: StyleConst().appColorLight,
    primaryColorLight: StyleConst().appColorDark,
    //primarySwatch: StyleConst().appColorLight,
    accentColor: StyleConst().appColorDark,
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: StyleConst().appColorLight,
    backgroundColor: StyleConst().appColorLight,
    bottomAppBarColor: StyleConst().barColorLight,
    cardColor: StyleConst().appColorLight,
    canvasColor: StyleConst().barColorLight,
    buttonColor: StyleConst().buttonColorLight,
    textTheme: TextTheme(
      headline1: TextStyle(color: StyleConst().appFontColorLight),
      headline2: TextStyle(color: StyleConst().appFontColorLight),
      headline3: TextStyle(color: StyleConst().appFontColorLight),
      headline4: TextStyle(color: StyleConst().appFontColorLight),
      subtitle1: TextStyle(color: StyleConst().appFontColorLight),
      subtitle2: TextStyle(color: StyleConst().appFontColorLight),
      bodyText1: TextStyle(color: StyleConst().appFontColorLight),
      bodyText2: TextStyle(color: StyleConst().appFontColorLight),
      caption: TextStyle(color: StyleConst().appFontColorLight),
      button: TextStyle(color: StyleConst().appFontColorLight),
      overline: TextStyle(color: StyleConst().appFontColorLight),
    ),
  );
  // theme light.
  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: StyleConst().appColorDark,
    primaryColorDark: StyleConst().appColorLight,
    //primarySwatch: StyleConst().appColorDark,
    accentColor: StyleConst().appColorLight,
    accentColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: StyleConst().appColorDark,
    backgroundColor: StyleConst().appColorDark,
    bottomAppBarColor: StyleConst().barColorDark,
    cardColor: StyleConst().appColorDark,
    canvasColor: StyleConst().barColorDark,
    buttonColor: StyleConst().buttonColorDark,
    textTheme: TextTheme(
      headline1: TextStyle(color: StyleConst().appFontColorDark),
      headline2: TextStyle(color: StyleConst().appFontColorDark),
      headline3: TextStyle(color: StyleConst().appFontColorDark),
      headline4: TextStyle(color: StyleConst().appFontColorDark),
      subtitle1: TextStyle(color: StyleConst().appFontColorDark),
      subtitle2: TextStyle(color: StyleConst().appFontColorDark),
      bodyText1: TextStyle(color: StyleConst().appFontColorDark),
      bodyText2: TextStyle(color: StyleConst().appFontColorDark),
      caption: TextStyle(color: StyleConst().appFontColorDark),
      button: TextStyle(color: StyleConst().appFontColorDark),
      overline: TextStyle(color: StyleConst().appFontColorDark),
    ),
  );
  // switching theme.
  toggleTheme() {
    isDark = !isDark;
    //current = _isDark ? _dark : _light;
    notifyListeners();
  }
}
