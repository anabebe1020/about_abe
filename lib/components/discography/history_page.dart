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
    Provider.of<HistoryViewModel>(context, listen: false).getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryViewModel>(builder: (context, model, child) {
      //debugLog('number of company: ${model.history.length}', '[history]');
      //debugLog('histories: ${model.history.toString()}', '[history]');
      //debugLog('history of lis: ${model.history[0].toString()}', '[history]');
      //debugLog('name of lis: ${model.history[0]['name']}', '[history]');
      //debugLog('number of lis: ${model.history[0]['career'][0]['position']}', '[history]');
      //debugLog('skills of lis: ${model.history[0]['career'][0]['overview']}', '[history]');
      return Column(children: <Widget>[
        ListView.builder(
          itemCount: model.history.length,
          itemBuilder: (BuildContext context, int index) {
            return _HistoryTileList(company: model.history[index]);
          },
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
      debugLog('_HistoryTileList', '[history]');
      debugLog('company ${company.toString()}', '[history]');
      //debugLog('company name ${company['name']}', '[history]');
      //debugLog('company order ${company['order']}', '[history]');
      final List<Widget> careers = [];
      company.forEach((key, value) {
        careers.add(_HistoryTile(career: value['career']));
      });
      return Column(children: careers
          //<Widget>[
          //ListView.builder(
          //  physics: const NeverScrollableScrollPhysics(),
          //  itemCount: careers.length,
          //  itemBuilder: (BuildContext context, int index) {
          //    return _HistoryTile(career: careers[index]);
          //  },
          //)
          //]
          );
    });
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({Key key, @required this.career}) : super(key: key);
  final dynamic career;

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryViewModel>(builder: (context, model, child) {
      debugLog('$career', '[history]');
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
                '${career['to']} ~ ${career['from']}',
                style: TextStyle(
                  fontSize: StyleConst().qiitaDiscriptionFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              StyleConst().horizontalSeparator,
              Text(
                '- ${career['position']}',
                style: TextStyle(
                  fontSize: StyleConst().qiitaDiscriptionFontSize,
                ),
              ),
              StyleConst().horizontalSeparator,
              Text(
                '- ${career['overview']}',
                style: TextStyle(
                  fontSize: StyleConst().qiitaDiscriptionFontSize,
                ),
              ),
              StyleConst().horizontalSeparator,
              Text(
                '- ${career['skills'].toString()}',
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
