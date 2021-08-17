import '../importer.dart';

final globalScaffoldKey = GlobalKey<ScaffoldState>();

/// View for home screen.
///
/// This screen serves as the home screen.
/// By touching the + button, you can add a designated SNS.
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).title),
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
        body: _HomeScreenBody(),
        floatingActionButton: Column(
          verticalDirection: VerticalDirection.up,
          children: [
            _AddFloatingActionButton(),
            //_CheckFloatingActionButton(),
            _CleanFloatingActionButton(),
          ],
        ),
      );
  }
}

/// Body in view.
class _HomeScreenBody extends StatelessWidget {
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
                  child: _ButtonList(),
                ),
              ],
            ),
          ),
        ]);
  }
}

/// Button list in body.
class _ButtonList extends StatelessWidget {
  const _ButtonList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, model, child) {
          return ListView.builder(
            itemCount: model.addedCount,
            itemBuilder: (BuildContext context, int index) {
              return _ButtonListTile(index: index);
            },
            //reverse: true,
          );
        }
    );
  }
}

/// Tile in button list.
class _ButtonListTile extends StatelessWidget {
  const _ButtonListTile({Key key, @required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, model, child) {
          final currentSns = model.getSns(index);
          return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: StyleConst().snsButtonHeight,
                maxHeight: StyleConst().snsButtonHeight,
                //maxWidth: 50.0,
              ),
              child: ElevatedButton(
                child:
                Text(currentSns.initial,
                    style: TextStyle(
                      color: StyleConst().snsButtonFontColor,
                      fontSize: StyleConst().snsButtonFontSize,
                    )
                ),
                style: ElevatedButton.styleFrom(
                  primary: currentSns.color,
                  onPrimary: StyleConst().snsButtonFontColor,
                  //shape: const CircleBorder(),
                ),
                onPressed: () => Navigator.of(context).pushNamed(
                    Routes().qiitaView, arguments: { 'userId': currentSns.userId }
                ),
              )
          );
        }
    );
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
            debugLog(
                'buttonList: ' +
                    Provider.of<HomeViewModel>(context, listen: false)
                        .addedCount
                        .toString(),
                logName);
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
