import '../importer.dart';

/// View for qiita login screen.
///
/// Enter your user token to complete the authentication of your request to Qiita.
class QiitaLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).title2),
          backgroundColor: StyleConst().appBarColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes().setting);
              },
            ),
          ],
        ),
        body: _QiitaLoginScreenBody(),
        floatingActionButton: _QiitaNextFloatingActionButton(),
      );
  }
}

/// Body in View.
class _QiitaLoginScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(16),
                    child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'ID'), // todo: ->messages
                        initialValue: 'anabebe',
                        onSaved: (value) {
                          Provider.of<HomeViewModel>(context).userId = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a token.';
                          }
                          return null;
                        })),
                Container(
                    margin: EdgeInsets.all(16),
                    child: TextFormField(
                        decoration:
                        InputDecoration(labelText: 'トークン'), // todo: ->messages
                        initialValue: Provider.of<HomeViewModel>(context).token,
                        onSaved: (value) {
                          Provider.of<HomeViewModel>(context).token = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a token.';
                          }
                          return null;
                        })),
              ],
            ),
          ),
        ]);
  }
}

/// FloatingActionButton for next.
class _QiitaNextFloatingActionButton extends StatelessWidget {
  final String logName = '[QIITA]';
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.arrow_forward_ios),
      backgroundColor: Colors.lightBlue,
      onPressed: () {
        debugLog('press', logName);
        Navigator.of(context).pop();
        Provider.of<HomeViewModel>(context, listen: false).addQiita();
      },
      tooltip: 'Next',
    );
  }
}
