import '../importer.dart';

/// body in view.
class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AccountViewModel>(context, listen: false).initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _GitHubArea(),
              _QiitaArea(),
            ],
          ),
        ),
      ],
    );
  }
}

class _GitHubArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: 360,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _GitHubTopArea(),
            _GitHubCenterArea(),
            _GitHubBottomArea(),
          ],
        ),
      ),
    );
  }
}

class _GitHubTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: StyleConst().topixPaddingH,
        vertical: 0,
      ),
      child: Center(
        child: Text(
          AppLocalizations.of(context).github.toString(),
          style: TextStyle(fontSize: StyleConst().appFontSizeLL),
        ),
      ),
    );
  }
}

class _GitHubCenterArea extends StatelessWidget {
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
            _GitHubTopLeftArea(),
            _GitHubTopRightArea(),
          ],
        ),
      ),
    );
  }
}

class _GitHubTopLeftArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountViewModel>(
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
                    image: NetworkImage(model.github.iconUrl.toString()),
                  ),
                ),
              ),
              StyleConst().horizontalSeparator,
              Text(
                model.github.userId.toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GitHubTopRightArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountViewModel>(
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
                  '${appLocal.followees}：${model.github.followees}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  '${appLocal.followers}：${model.github.followers}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  '${appLocal.items}：${model.github.items}',
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

class _GitHubBottomArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountViewModel>(
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
                  AppLocalizations.of(context).overview ?? '',
                  style: Theme.of(context).textTheme.headline5,
                ),
                StyleConst().horizontalSeparator,
                Text(
                  model.github.description.toString(),
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

class _QiitaArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: 360,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _QiitaTopArea(),
            _QiitaCenterArea(),
            _QiitaBottomArea(),
          ],
        ),
      ),
    );
  }
}

class _QiitaTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: StyleConst().topixPaddingH,
        vertical: 0,
      ),
      child: Center(
        child: Text(
          AppLocalizations.of(context).qiita.toString(),
          style: TextStyle(fontSize: StyleConst().appFontSizeLL),
        ),
      ),
    );
  }
}

class _QiitaCenterArea extends StatelessWidget {
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
            _QiitaTopLeftArea(),
            _QiitaTopRightArea(),
          ],
        ),
      ),
    );
  }
}

class _QiitaTopLeftArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountViewModel>(
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
                    image: NetworkImage(model.qiita.iconUrl.toString()),
                  ),
                ),
              ),
              StyleConst().horizontalSeparator,
              Text(
                model.qiita.userId.toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QiitaTopRightArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountViewModel>(
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
                  '${appLocal.followees}：${model.qiita.followees}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  '${appLocal.followers}：${model.qiita.followers}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  '${appLocal.items}：${model.qiita.items}',
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

class _QiitaBottomArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountViewModel>(
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
                  AppLocalizations.of(context).overview ?? '',
                  style: Theme.of(context).textTheme.headline5,
                ),
                StyleConst().horizontalSeparator,
                Text(
                  model.qiita.description.toString(),
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
