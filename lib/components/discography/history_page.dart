import '../importer.dart';

const String logName = 'HISTORY';

/// body in view.
class HistoryPage extends StatefulWidget {
  const HistoryPage({Key key}) : super(key: key);
  @override
  _HistoryPageState createState() => _HistoryPageState();
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
      final _history = List<Map<String, dynamic>>.from(model.history.reversed);
      return Column(children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: _history.length,
            itemBuilder: (BuildContext context, int index) {
              return _HistoryTileList(company: _history[index]);
            },
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
      final _career = company['career'] as List<Map<String, dynamic>>;
      return Column(children: <Widget>[
        Text(
          '${company['name']}',
          style: Theme.of(context).textTheme.headline5,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _career.length,
          itemBuilder: (BuildContext context, int index) {
            return _HistoryTile(career: _career[index]);
          },
          reverse: true,
        ),
        StyleConst().horizontalSeparator,
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
              style: Theme.of(context).textTheme.headline6,
            ),
            StyleConst().horizontalSeparator,
            Text(
              '- ${career['position']}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            StyleConst().horizontalSeparator,
            Text(
              '- ${career['overview']}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            StyleConst().horizontalSeparator,
            Text(
              '- ${career['skills'].toString()}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      );
    });
  }
}
