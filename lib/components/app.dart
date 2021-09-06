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
            // theme: ThemeData(
            //   primarySwatch: Colors.blue,
            //   visualDensity: VisualDensity.adaptivePlatformDensity,
            //   primaryColor: StyleConst().backgroundDarkColor,
            //   scaffoldBackgroundColor: StyleConst().backgroundLightColor,
            // ),
            // darkTheme: ThemeData(
            //   primarySwatch: Colors.blue,
            //   visualDensity: VisualDensity.adaptivePlatformDensity,
            //   primaryColor: StyleConst().backgroundDarkColor,
            //   scaffoldBackgroundColor: StyleConst().backgroundLightColor,
            // ),
            theme: theme.current,
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
  ThemeData current = ThemeData.light();
  bool _isDark = false;

  // switching theme.
  toggleTheme() {
    _isDark = !_isDark;
    current = _isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}
