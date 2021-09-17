import '../importer.dart';

/// body in view.
class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => new _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    //Firebase.initializeApp();
    Provider.of<HistoryViewModel>(context, listen: false).getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Column(
            //key: globalScaffoldKey,
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: StyleConst().topixPaddingH,
                  top: StyleConst().topixPaddingV,
                ),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    'Topix',
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: StyleConst().snsButtonFontColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _HistoryTileList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HistoryTileList extends StatelessWidget {
  const _HistoryTileList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryViewModel>(builder: (context, model, child) {
      return ListView.builder(
        itemCount: 1, //model.addedCount,
        itemBuilder: (BuildContext context, int index) {
          return _HistoryTile(index: index);
        },
        //reverse: true,
      );
    });
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({Key key, @required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryViewModel>(
      builder: (context, model, child) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: StyleConst().snsButtonHeight,
            maxHeight: StyleConst().snsButtonHeight,
            //maxWidth: 50.0,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: StyleConst().topixPaddingH,
              vertical: StyleConst().topixPaddingV,
            ),
            child: ElevatedButton(
              child: Row(children: [
                Image.asset(
                  StyleConst().qiitaIconPath,
                  width: StyleConst().topixIconSize,
                  height: StyleConst().topixIconSize,
                ),
                StyleConst().verticalSeparator,
                Flexible(
                  child: Text(
                    'あああ',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ]),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).cardColor,
                //onPrimary: ,//StyleConst().snsButtonFontColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 0.0,
              ),
              onPressed: () {
                //_launchURL(model);
              },
            ),
          ),
        );
      },
    );
  }
}
