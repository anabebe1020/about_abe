import '../importer.dart';

/// View for app setting.
class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).setting,
        ),
        elevation: 0.0,
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
    return Container(
      child: ListTile(
        leading: Icon(
          Icons.language,
          //size: 24,
        ),
        title: Text(
          AppLocalizations.of(context).locale,
          style: TextStyle(fontSize: 24),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
        ),
        onTap: () {
          Navigator.of(context).pushNamed(Routes().locale);
        },
      ),
    );
  }

  Widget darkMode(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (context, model, child) {
        return ListTile(
          leading: Icon(
            Icons.language,
            //size: 24,
          ),
          title: Text(
            AppLocalizations.of(context).darkMode,
            style: TextStyle(fontSize: 24),
          ),
          trailing: new Switch(
            value: model.isDark,
            activeColor: Colors.orange,
            activeTrackColor: Colors.grey,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey,
            onChanged: (bool) {},
          ),
          onTap: () {
            model.toggleTheme();
          },
        );
      },
    );
  }
}
