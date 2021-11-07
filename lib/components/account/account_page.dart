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
              height: 720,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _GitHubUserArea(),
                  _GitHubBioArea(),
                  _GitHubInfoArea(),
                  _GitHubReposArea(),
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
                  style: Theme.of(context).textTheme.bodyText1,
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
              createIconSet(
                SNSIcons.github,
                gh.userId.toString(),
                isLinked: true,
                url: '${SnsConst().ghBaseUrl}/${gh.userId.toString()}',
              ),
              createIconSet(
                SNSIcons.twitter,
                gh.twitter.toString(),
                isLinked: true,
                url: '${SnsConst().twBaseUrl}/${gh.twitter.toString()}',
              ),
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
          style: Theme.of(context).textTheme.bodyText1,
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

class _GitHubReposArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountViewModel>(
      builder: (context, model, child) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: StyleConst().topixPaddingH,
            vertical: 0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: _ReposTileList()),
            ],
          ),
        );
      },
    );
  }
}

/// Button list in body.
class _ReposTileList extends StatelessWidget {
  const _ReposTileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountViewModel>(builder: (context, model, child) {
      return ListView.builder(
        itemCount: model.repos.length,
        itemBuilder: (BuildContext context, int index) {
          return _RepoTile(repo: model.repos[index]);
        },
        scrollDirection: Axis.horizontal,
        //reverse: true,
      );
    });
  }
}

class _RepoTile extends StatelessWidget {
  const _RepoTile({Key? key, @required this.repo}) : super(key: key);
  final GitHubRepoModel? repo;

  @override
  Widget build(BuildContext context) {
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
                  repo!.name,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ],
          ),
          onPressed: () {
            _launchURL(repo!.url);
          },
        ),
      ),
    );
  }

  Future<dynamic> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      final Error err = ArgumentError('Could not Launch $url');
      throw err;
    }
  }
}
