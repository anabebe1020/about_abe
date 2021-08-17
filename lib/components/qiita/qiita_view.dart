import '../importer.dart';

/// View for qiita screen.
///
/// Make a request to Qiita to display user information.
class QiitaScreen extends StatelessWidget {
  const QiitaScreen({Key key, String userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Injects SecondViewModel into this widgets.
        ChangeNotifierProvider(create: (_) => QiitaViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).title2),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes().setting);
              },
            ),
          ],
        ),
        body: QiitaScreenBody(),
        floatingActionButton: Column(
          verticalDirection: VerticalDirection.up,
          children: [
            //nextButton('second', () => {}),
          ],
        ),
      ),
    );
  }
}

/// body in view.
class QiitaScreenBody extends StatefulWidget {
  @override
  _QiitaScreenBodyState createState() => new _QiitaScreenBodyState();
}

class _QiitaScreenBodyState extends State<QiitaScreenBody> {
  @override
  void initState() {
    super.initState();
    Provider.of<QiitaViewModel>(context, listen: false).getUserInfo('anabebe');
  }

  @override
  Widget build(BuildContext context) {
    final double radius = 100;
    return Stack(children: <Widget>[
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(Provider.of<QiitaViewModel>(context)
                        .iconUrl
                        .toString())),
              ),
              //child: Image.network(
              //Provider.of<SecondViewModel>(context).iconUrl.toString()),
            ),
            Text(
              Provider.of<QiitaViewModel>(context).userId.toString(),
              style: TextStyle(color: Colors.black),
            ),
            Text(
              Provider.of<QiitaViewModel>(context).description.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    ]);
  }
}
