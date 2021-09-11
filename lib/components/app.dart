import 'importer.dart';

/// Application.
class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Injects HomeViewModel into this widgets.
        ChangeNotifierProvider(create: (_) => AppTheme()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => SettingViewModel()),
        ChangeNotifierProvider(create: (_) => LocaleViewModel()),
        ChangeNotifierProvider(create: (_) => QiitaViewModel()),
      ],
      child: Consumer<AppTheme>(
        builder: (context, theme, child) {
          return MaterialApp(
            title: AppConst().title,
            // theme: theme.light,
            // darkTheme: theme.dark,
            theme: theme.isDark ? theme.dark : theme.light,
            themeMode: ThemeMode.system,
            home: HomeScreen(),
            routes: {
              //'/QiitaLoginScreen': (_) => QiitaLoginScreen(),
              '/SettingScreen': (_) => SettingScreen(),
              '/LocaleScreen': (_) => LocaleScreen(),
              //'/QiitaScreen': (_) => QiitaScreen(),
            },
            localizationsDelegates: [
              const AppLocalizationsDelegate(), // <- 登録
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en'), // <- 対応している言語を登録
              const Locale('ja'), // <- 対応している言語を登録
            ],
          );
        },
      ),
    );
  }
}

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
    //textTheme: TextTheme(bodyText1: StyleConst().appColorDark),
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
    textTheme: TextTheme(),
  );
  // switching theme.
  toggleTheme() {
    isDark = !isDark;
    //current = _isDark ? _dark : _light;
    notifyListeners();
  }
}
