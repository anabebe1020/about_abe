import '../importer.dart';

/// View for app setting.
class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).setting,
          //style: TextStyle(
          //  color: StyleConst().appBarTextColor,
          //)
        ),
        iconTheme: IconThemeData(
          color: StyleConst().appBarTextColor,
        ),
        backgroundColor: StyleConst().appBarColor,
        foregroundColor: StyleConst().appBarTextColor,
        elevation: 0.0,
      ),
      body: _SettingScreenBody(),
      //bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[]),
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
