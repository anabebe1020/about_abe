import '../importer.dart';

/// View for app setting.
class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Injects SettingViewModel into this widgets.
        ChangeNotifierProvider(create: (_) => SettingViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).setting),
        ),
        body: _SettingScreenBody(),
      ),
    );
  }
}

/// body in view.
class _SettingScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                child: Text(
                  AppLocalizations.of(context).locale,
                  textAlign: TextAlign.left,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes().locale);
                },
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
