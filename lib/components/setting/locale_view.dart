import '../importer.dart';

/// View for setting locales.
class LocaleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).locale),
      ),
      body: _LocaleScreenBody(),
    );
  }
}

/// body in view.
class _LocaleScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Center(
        child: Column(
          children: <Widget>[
            Text(
              AppLocalizations.of(context).english,
              textAlign: TextAlign.left,
            ),
            Text(
              AppLocalizations.of(context).japanese,
              style: TextStyle(color: Colors.black, fontSize: 32),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    ]);
  }
}
