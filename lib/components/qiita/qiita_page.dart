import '../importer.dart';

/// body in view.
class QiitaPage extends StatefulWidget {
  @override
  _QiitaPageState createState() => new _QiitaPageState();
}

class _QiitaPageState extends State<QiitaPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<QiitaViewModel>(context, listen: false).getUserInfo('anabebe');
  }

  @override
  Widget build(BuildContext context) {
    final double radius = 100;
    return Consumer<QiitaViewModel>(builder: (context, model, child) {
      return Stack(children: <Widget>[
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: StyleConst().topixPaddingH,
                  vertical: StyleConst().topixPaddingV,
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: radius,
                          height: radius,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(model.iconUrl.toString()),
                            ),
                          ),
                        ),
                        StyleConst().horizontalSeparator,
                        Text(
                          model.userId.toString(),
                          style: TextStyle(
                            color: StyleConst().snsButtonFontColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: StyleConst().topixPaddingH,
                  vertical: StyleConst().topixPaddingV,
                ),
                child: Text(
                  model.description.toString(),
                  style: TextStyle(
                    color: StyleConst().snsButtonFontColor,
                    fontSize: StyleConst().qiitaDiscriptionFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]);
    });
  }
}
