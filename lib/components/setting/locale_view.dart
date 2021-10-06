import '../importer.dart';

/// View for setting locales.
class LocaleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).locale,
          style: Theme.of(context).textTheme.subtitle1,
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
    return Consumer<LocaleViewModel>(builder: (context, model, child) {
      return Stack(children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: StyleConst().topixPaddingH,
            vertical: StyleConst().topixPaddingV,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RadioListTile(
                title: Text(
                  AppLocalizations.of(context).english,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                value: RadioValue.FIRST,
                groupValue: model.gValue,
                activeColor: Theme.of(context).accentColor,
                onChanged: (RadioValue value) => {
                  Provider.of<AppTheme>(context, listen: false).switchLocale(Locale('en')),
                  model.gValue = value,
                },
              ),
              RadioListTile(
                title: Text(
                  AppLocalizations.of(context).japanese,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                value: RadioValue.SECOND,
                groupValue: model.gValue,
                activeColor: Theme.of(context).accentColor,
                onChanged: (RadioValue value) => {
                  Provider.of<AppTheme>(context, listen: false).switchLocale(Locale('ja')),
                  model.gValue = value,
                },
              ),
            ],
          ),
        ),
      ]);
    });
  }
}
