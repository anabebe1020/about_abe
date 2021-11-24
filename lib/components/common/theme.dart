import '../importer.dart';

/// State of fix theme.
class AppTheme extends ChangeNotifier {
  // default theme.
  bool isDark = false;
  // theme light.
  ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: StyleConst().appColorLight,
    primaryColorLight: StyleConst().appColorDark,
    //primarySwatch: StyleConst().appColorLight,
    appBarTheme: AppBarTheme(
      backgroundColor: StyleConst().appColorLight,
      foregroundColor: StyleConst().appColorDark,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: StyleConst().appColorLight,
    ),
    scaffoldBackgroundColor: StyleConst().appColorLight,
    backgroundColor: StyleConst().appColorLight,
    bottomAppBarColor: StyleConst().barColorLight,
    cardColor: StyleConst().topixButtonColorLight,
    canvasColor: StyleConst().barColorLight,
    //buttonColor: StyleConst().buttonColorLight,
    unselectedWidgetColor: StyleConst().unSelectedButtonColorLight,
    // theme of text.
    textTheme: TextTheme(
      headline1: TextStyle(color: StyleConst().appFontColorLight),
      headline2: TextStyle(color: StyleConst().appFontColorLight),
      headline3: TextStyle(color: StyleConst().appFontColorLight),
      headline4: TextStyle(
        color: StyleConst().appFontColorLight,
        fontSize: StyleConst().appFontSizeL,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: StyleConst().appFontColorLight,
        fontSize: StyleConst().appFontSizeM,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: StyleConst().appFontColorLight,
        fontSize: StyleConst().appFontSizeS,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: StyleConst().appFontColorLight,
        fontSize: StyleConst().appFontSizeM,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(color: StyleConst().appFontColorLight),
      bodyText1: TextStyle(
        color: StyleConst().appFontColorLight,
        fontSize: StyleConst().appFontSizeM,
      ),
      bodyText2: TextStyle(
        color: StyleConst().appFontColorLight,
        fontSize: StyleConst().appFontSizeS,
      ),
      caption: TextStyle(color: StyleConst().appFontColorLight),
      button: TextStyle(
        color: StyleConst().topixFontColorLight,
        fontSize: StyleConst().appFontSizeS,
      ),
      overline: TextStyle(color: StyleConst().appFontColorLight),
    ),
  );
  // theme light.
  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: StyleConst().appColorDark,
    primaryColorDark: StyleConst().appColorLight,
    //primarySwatch: StyleConst().appColorDark,
    appBarTheme: AppBarTheme(
      backgroundColor: StyleConst().appColorDark,
      foregroundColor: StyleConst().appColorLight,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: StyleConst().appColorLight,
    ),
    scaffoldBackgroundColor: StyleConst().appColorDark,
    backgroundColor: StyleConst().appColorDark,
    bottomAppBarColor: StyleConst().barColorDark,
    cardColor: StyleConst().topixButtonColordark,
    canvasColor: StyleConst().barColorDark,
    //buttonColor: StyleConst().buttonColorDark,
    unselectedWidgetColor: StyleConst().unSelectedButtonColorDark,
    // theme of text.
    textTheme: TextTheme(
      headline1: TextStyle(color: StyleConst().appFontColorDark),
      headline2: TextStyle(color: StyleConst().appFontColorDark),
      headline3: TextStyle(color: StyleConst().appFontColorDark),
      headline4: TextStyle(
        color: StyleConst().appFontColorDark,
        fontSize: StyleConst().appFontSizeL,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: StyleConst().appFontColorDark,
        fontSize: StyleConst().appFontSizeM,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: StyleConst().appFontColorDark,
        fontSize: StyleConst().appFontSizeS,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: StyleConst().appFontColorDark,
        fontSize: StyleConst().appFontSizeM,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(color: StyleConst().appFontColorDark),
      bodyText1: TextStyle(
        color: StyleConst().appFontColorDark,
        fontSize: StyleConst().appFontSizeM,
      ),
      bodyText2: TextStyle(
        color: StyleConst().appFontColorDark,
        fontSize: StyleConst().appFontSizeS,
      ),
      caption: TextStyle(color: StyleConst().appFontColorDark),
      button: TextStyle(
        color: StyleConst().topixFontColorDark,
        fontSize: StyleConst().snsButtonFontSize,
      ),
      overline: TextStyle(color: StyleConst().appFontColorDark),
    ),
  );

  // switching theme.
  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  // default locale;
  Locale currentLocale = const Locale('ja');

  // switching locale.
  void switchLocale(Locale locale) {
    if (const AppLocalizationsDelegate().isSupported(locale)) {
      currentLocale = locale;
    }
    notifyListeners();
  }
}
