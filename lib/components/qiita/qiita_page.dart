import '../importer.dart';

/// body in view.
class QiitaPage extends StatefulWidget {
  const QiitaPage({Key key}) : super(key: key);
  @override
  _QiitaPageState createState() => _QiitaPageState();
}

class _QiitaPageState extends State<QiitaPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<QiitaViewModel>(context, listen: false).getUserInfo('anabebe');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _TopArea(),
              _BottomArea(),
            ],
          ),
        ),
      ],
    );
  }
}

class _TopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: StyleConst().topixPaddingH,
        vertical: StyleConst().topixPaddingV,
      ),
      child: SizedBox(
        height: 140,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _TopLeftArea(),
            _TopRightArea(),
          ],
        ),
      ),
    );
  }
}

class _TopLeftArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QiitaViewModel>(
      builder: (context, model, child) {
        return Padding(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
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
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TopRightArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QiitaViewModel>(
      builder: (context, model, child) {
        final appLocal = AppLocalizations.of(context);
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${appLocal.followees}：${model.followees}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  '${appLocal.followers}：${model.followers}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  '${appLocal.items}：${model.items}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BottomArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QiitaViewModel>(
      builder: (context, model, child) {
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
                  AppLocalizations.of(context).overview,
                  style: Theme.of(context).textTheme.headline5,
                ),
                StyleConst().horizontalSeparator,
                Text(
                  model.description.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
