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
    HomePage(),
    QiitaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).title,
            style: TextStyle(
              color: StyleConst().appBarTextColor,
            ),
          ),
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
