import '../importer.dart';

/// View for app setting.
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).setting ?? '',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        elevation: 0,
      ),
      body: _SettingScreenBody(),
    );
  }
}

/// body in view.
class _SettingScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        locale(context),
        darkMode(context),
      ],
    );
  }

  Widget locale(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.language,
        size: StyleConst().appIconSizeM,
      ),
      title: Text(
        AppLocalizations.of(context).locale ?? '',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: StyleConst().appIconSizeM,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(Routes().locale);
      },
    );
  }

  Widget darkMode(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (context, model, child) {
        return ListTile(
          leading: Icon(
            Icons.language,
            size: StyleConst().appIconSizeM,
          ),
          title: Text(
            AppLocalizations.of(context).darkMode ?? '',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          trailing: Switch(
            value: model.isDark,
            activeColor: StyleConst().appColorLight,
            activeTrackColor: Colors.grey,
            inactiveThumbColor: StyleConst().appColorDark,
            inactiveTrackColor: Colors.grey,
            onChanged: (bool bl) {
              model.toggleTheme();
            },
          ),
        );
      },
    );
  }
}
