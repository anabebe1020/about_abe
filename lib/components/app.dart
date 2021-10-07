import 'importer.dart';

/// Application.
class App extends StatelessWidget {
  const App({Key key}) : super(key: key);
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
              '/SettingScreen': (_) => const SettingScreen(),
              '/LocaleScreen': (_) => const LocaleScreen(),
            },
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('ja'),
            ],
            locale: theme.currentLocale,
          );
        },
      ),
    );
  }
}
