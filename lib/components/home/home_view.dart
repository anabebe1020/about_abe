import '../importer.dart';

final globalScaffoldKey = GlobalKey<ScaffoldState>();

/// View for home screen.
///
/// This screen serves as the home screen.
/// By touching the + button, you can add a designated SNS.
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _pageController = PageController();
  // Display page list.
  static final List<Widget> _pageList = [
    const HomePage(),
    const QiitaPage(),
    const HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).title ?? '',
            //style: Theme.of(context).textTheme.subtitle1,
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.settings,
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
          //backgroundColor: StyleConst().backgroundDarkColor,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).unselectedWidgetColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: AppLocalizations.of(context).homeTab,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              label: AppLocalizations.of(context).accountTab,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.history),
              label: AppLocalizations.of(context).discographyTab,
            ),
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
