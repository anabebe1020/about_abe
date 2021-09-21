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
    return Consumer<HistoryViewModel>(builder: (context, model, child) {
      final keys = model.history.keys;
      List<Widget> tiles = [];
      keys.forEach((key) {
        tiles.insert(0, Expanded(child: _HistoryTileList(name: key)));
      });
      return Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: tiles,
            ),
          ),
        ],
      );
    });
  }
}

class _HistoryTileList extends StatelessWidget {
  const _HistoryTileList({Key key, @required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryViewModel>(builder: (context, model, child) {
      return ListView.builder(
        itemCount: model.history[name].length,
        itemBuilder: (BuildContext context, int index) {
          return _HistoryTile(career: model.history[name], index: index);
        },
        //reverse: true,
      );
    });
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({Key key, @required this.career, @required this.index}) : super(key: key);
  final dynamic career;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryViewModel>(builder: (context, model, child) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: StyleConst().topixPaddingH,
            vertical: StyleConst().topixPaddingV,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${career[index]['to']} ~ ${career[index]['from']}',
                style: TextStyle(
                  fontSize: StyleConst().qiitaDiscriptionFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              StyleConst().horizontalSeparator,
              Text(
                '- ${career[index]['job']}',
                style: TextStyle(
                  fontSize: StyleConst().qiitaDiscriptionFontSize,
                ),
              ),
              StyleConst().horizontalSeparator,
              Text(
                '- ${career[index]['overview']}',
                style: TextStyle(
                  fontSize: StyleConst().qiitaDiscriptionFontSize,
                ),
              ),
              StyleConst().horizontalSeparator,
              Text(
                '- ${career[index]['skills'].toString()}',
                style: TextStyle(
                  fontSize: StyleConst().qiitaDiscriptionFontSize,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
