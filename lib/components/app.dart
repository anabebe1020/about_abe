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
        ChangeNotifierProvider(create: (_) => HistoryViewModel()),
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
