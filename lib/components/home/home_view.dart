import '../importer.dart';

final globalScaffoldKey = GlobalKey<ScaffoldState>();

/// View for home screen.
///
/// This screen serves as the home screen.
/// By touching the + button, you can add a designated SNS.
class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  // Display page list.
  static List<Widget> _pageList = [
    _HomeScreenBody(),
    QiitaScreenBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).title,
              style: TextStyle(
                color: StyleConst().appBarTextColor,
              )),
          backgroundColor: StyleConst().appBarColor,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: StyleConst().appBarTextColor,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes().setting);
              },
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            model.onPageChanged(index);
          },
          children: _pageList,
        ),
        // _pageList[Provider.of<HomeViewModel>(context).currentIndex]
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: StyleConst().backgroundDarkColor,
          selectedItemColor: StyleConst().backgroundLightColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Discography',
            ),
            // BottomNavigationBarItem(
            //   icon: FaIcon(FontAwesomeIcons.qq),
            //   label: 'Qiita',
            // ),
          ],
          currentIndex: model.currentIndex,
          onTap: (index) {
            model.onItemTapped(index, _pageController);
          },
        ),
      );
    });
  }
}

/// body in view.
class _HomeScreenBody extends StatefulWidget {
  @override
  _HomeScreenBodyState createState() => new _HomeScreenBodyState();
}

/// Body in view.
class _HomeScreenBodyState extends State<_HomeScreenBody> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).getItemsQiita();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      //AppBackground(),
      Center(
        child: Column(
          key: globalScaffoldKey,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Expanded(
              child: _TopixTile(), //_ButtonList(),
            ),
          ],
        ),
      ),
    ]);
  }
}

/// Button list in body.
class _TopixTile extends StatelessWidget {
  const _TopixTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      return ListView.builder(
        itemCount: 1, //model.addedCount,
        itemBuilder: (BuildContext context, int index) {
          return _TopixTileList(index: index);
        },
        //reverse: true,
      );
    });
  }
}

/// Tile in button list.
class _TopixTileList extends StatelessWidget {
  const _TopixTileList({Key key, @required this.index}) : super(key: key);
  final int index;

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
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: ElevatedButton(
              child: Row(children: [
                Image.asset(
                  'images/icon_qiita.png',
                  width: 60,
                  height: 60,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    model.title,
                    style: TextStyle(
                      color: StyleConst().snsButtonFontColor,
                      fontSize: StyleConst().snsButtonFontSize,
                    ),
                  ),
                ),
              ]),
              style: ElevatedButton.styleFrom(
                primary: StyleConst().snaButtonColor,
                onPrimary: StyleConst().snsButtonFontColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () => {},
            ),
          ),
        );
      },
    );
  }
}

/*
/// Button list in body.
class _ButtonList extends StatelessWidget {
  const _ButtonList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      return ListView.builder(
        itemCount: model.addedCount,
        itemBuilder: (BuildContext context, int index) {
          return _ButtonListTile(index: index);
        },
        //reverse: true,
      );
    });
  }
}

/// Tile in button list.
class _ButtonListTile extends StatelessWidget {
  const _ButtonListTile({Key key, @required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      final currentSns = model.getSns(index);
      return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: StyleConst().snsButtonHeight,
            maxHeight: StyleConst().snsButtonHeight,
            //maxWidth: 50.0,
          ),
          child: ElevatedButton(
            child: Text(currentSns.initial,
                style: TextStyle(
                  color: StyleConst().snsButtonFontColor,
                  fontSize: StyleConst().snsButtonFontSize,
                )),
            style: ElevatedButton.styleFrom(
              primary: currentSns.color,
              onPrimary: StyleConst().snsButtonFontColor,
              //shape: const CircleBorder(),
            ),
            onPressed: () => Navigator.of(context).pushNamed(Routes().qiitaView, arguments: {'userId': currentSns.userId}),
          ));
    });
  }
}

/// FloatingActionButton for add.
class _AddFloatingActionButton extends StatelessWidget {
  final String logName = '[HOME]';
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'add',
      child: Icon(Icons.add),
      backgroundColor: StyleConst().faButtonColor1,
      onPressed: () {
        debugLog('press', logName);
        halfModal(context);
      },
      tooltip: 'Add',
    );
  }
}

/// FloatingActionButton for check.
class _CheckFloatingActionButton extends StatelessWidget {
  final String logName = '[HOME]';
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'check',
      child: Icon(Icons.remove_red_eye),
      backgroundColor: Colors.pink,
      onPressed: () {
        debugLog('buttonList: ' + Provider.of<HomeViewModel>(context, listen: false).addedCount.toString(), logName);
      },
      tooltip: 'Check',
    );
  }
}

/// FloatingActionButton for clean.
class _CleanFloatingActionButton extends StatelessWidget {
  final String logName = '[HOME]';
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'clean',
      child: Icon(Icons.cleaning_services),
      backgroundColor: StyleConst().faButtonColor2,
      onPressed: () {
        Provider.of<HomeViewModel>(context, listen: false).cleanSns();
      },
      tooltip: 'Clean',
    );
  }
}
*/