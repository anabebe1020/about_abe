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
          child: Padding(
            padding: EdgeInsets.zero,
            child: SizedBox(
              height: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _GitHubUserArea(),
                  _GitHubBioArea(),
                  _GitHubInfoArea(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GitHubUserArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: StyleConst().topixPaddingH,
        vertical: StyleConst().topixPaddingV,
      ),
      child: SizedBox(
        //height: 140,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _GitHubUserLeftArea(),
            _GitHubUserRightArea(),
          ],
        ),
      ),
    );
  }
}

class _GitHubUserLeftArea extends StatelessWidget {
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
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(model.github.iconUrl.toString()),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GitHubUserRightArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountViewModel>(
      builder: (context, model, child) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              model.github.name.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        );
      },
    );
  }
}

class _GitHubBioArea extends StatelessWidget {
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

class _GitHubInfoArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountViewModel>(
      builder: (context, model, child) {
        final gh = model.github;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: StyleConst().topixPaddingH,
            vertical: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  createIconSet(
                    Icons.corporate_fare,
                    gh.company.toString(),
                  ),
                  StyleConst().verticalSeparator,
                  createIconSet(
                    Icons.add_location_outlined,
                    gh.location.toString(),
                  ),
                ],
              ),
              createIconSet(
                Icons.insert_link_outlined,
                gh.link.toString(),
                isLinked: true,
                url: gh.link.toString(),
              ),
              Row(
                children: [
                  createIconSet(
                    SNSIcons.github,
                    gh.userId.toString(),
                    isLinked: true,
                    url: '${SnsConst().ghBaseUrl}/${gh.userId.toString()}',
                  ),
                  StyleConst().verticalSeparator,
                  createIconSet(
                    SNSIcons.twitter,
                    gh.twitter.toString(),
                    isLinked: true,
                    url: '${SnsConst().twBaseUrl}/${gh.twitter.toString()}',
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget createIconSet(
    IconData icon,
    String text, {
    bool isLinked = false,
    String url = '',
  }) {
    return Consumer<AccountViewModel>(
      builder: (context, model, child) {
        final textWidget = Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        );
        return Row(
          children: [
            Icon(icon),
            StyleConst().verticalSeparator,
            isLinked
                ? InkWell(
                    highlightColor: Colors.amber,
                    splashColor: Colors.amber,
                    child: textWidget,
                    onTap: () async {
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                  )
                : textWidget
          ],
        );
      },
    );
  }
}

/*
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
*/
