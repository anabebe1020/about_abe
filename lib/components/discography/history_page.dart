import '../importer.dart';

final String logName = 'HISTORY';

/// body in view.
class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => new _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HistoryViewModel>(context, listen: false).getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryViewModel>(builder: (context, model, child) {
      return Column(children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: model.history.length,
            itemBuilder: (BuildContext context, int index) {
              return _HistoryTileList(company: model.history[index]);
            },
            reverse: true,
          ),
        )
      ]);
    });
  }
}

class _HistoryTileList extends StatelessWidget {
  const _HistoryTileList({Key key, @required this.company}) : super(key: key);
  final Map<String, dynamic> company;

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryViewModel>(builder: (context, model, child) {
      final _career = company['career'];
      return Column(children: <Widget>[
        Text(
          '${company['name']}',
          style: TextStyle(
            fontSize: StyleConst().historycompanyNameFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _career.length,
          itemBuilder: (BuildContext context, int index) {
            return _HistoryTile(career: _career[index]);
          },
          reverse: true,
        ),
      ]);
    });
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({Key key, @required this.career}) : super(key: key);
  final Map<String, dynamic> career;

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryViewModel>(builder: (context, model, child) {
      //debugLog('$career', logName);
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: StyleConst().topixPaddingH,
          vertical: StyleConst().topixPaddingV,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${career['to']} ~ ${career['from']}',
              style: TextStyle(
                fontSize: StyleConst().historyDiscriptionFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            StyleConst().horizontalSeparator,
            Text(
              '- ${career['position']}',
              style: TextStyle(
                fontSize: StyleConst().historyDiscriptionFontSize,
              ),
            ),
            StyleConst().horizontalSeparator,
            Text(
              '- ${career['overview']}',
              style: TextStyle(
                fontSize: StyleConst().historyDiscriptionFontSize,
              ),
            ),
            StyleConst().horizontalSeparator,
            Text(
              '- ${career['skills'].toString()}',
              style: TextStyle(
                fontSize: StyleConst().historyDiscriptionFontSize,
              ),
            ),
          ],
        ),
      );
    });
  }
}
