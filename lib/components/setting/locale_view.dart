import '../importer.dart';

/// View for setting locales.
class LocaleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).locale,
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
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
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: StyleConst().topixPaddingH,
          vertical: StyleConst().topixPaddingV,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).english,
              textAlign: TextAlign.left,
            ),
            Text(
              AppLocalizations.of(context).japanese,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    ]);
  }
}
