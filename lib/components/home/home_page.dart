import '../importer.dart';

/// body in view.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

/// Body in view.
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Center(
        child: Column(
          key: globalScaffoldKey,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: StyleConst().topixPaddingH,
                top: StyleConst().topixPaddingV,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  AppLocalizations.of(context).topix ?? '',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            const Expanded(
              child: _TopixTileList(),
            ),
          ],
        ),
      ),
    ]);
  }
}

/// Button list in body.
class _TopixTileList extends StatelessWidget {
  const _TopixTileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      return ListView.builder(
        itemCount: 1, //model.addedCount,
        itemBuilder: (BuildContext context, int index) {
          return _TopixTile(index: index);
        },
        //reverse: true,
      );
    });
  }
}

/// Tile in button list.
class _TopixTile extends StatelessWidget {
  const _TopixTile({Key? key, @required this.index}) : super(key: key);
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
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
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 0,
              ),
              child: Row(
                children: [
                  Image.asset(
                    StyleConst().qiitaIconPath,
                    width: StyleConst().topixIconSize,
                    height: StyleConst().topixIconSize,
                  ),
                  StyleConst().verticalSeparator,
                  Flexible(
                    child: Text(
                      model.title,
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                _launchURL(model);
              },
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _launchURL(HomeViewModel model) async {
    if (await canLaunch(model.url)) {
      await launch(model.url);
    } else {
      final Error err = ArgumentError('Could not Launch ${model.url}');
      throw err;
    }
  }
}
