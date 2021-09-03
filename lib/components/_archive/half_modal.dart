import 'package:provider/provider.dart';

import '../importer.dart';

/// Half modal for adding SNS.
Future<void> halfModal(BuildContext context) {
  return (showModalBottomSheet<void>(
    context: context,
    backgroundColor: StyleConst().backgroundDarkColor,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.add, color: StyleConst().snsButtonFontColor),
            title: Text('Qiita',
                style: TextStyle(
                  color: StyleConst().snsButtonFontColor,
                )),
            onTap: () async {
              if(Provider.of<HomeViewModel>(context, listen: false).isAddedSns(SnsConst().qiita)) {
                await showDialog<int>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context){
                    return duplicateDialog(context);
                  }
                );
                Navigator.pop(context);
              } else {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(Routes().qiitaLogin);
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.add, color: StyleConst().snsButtonFontColor),
            title: Text('Sample',
                style: TextStyle(
                  color: StyleConst().snsButtonFontColor,
                )),
            onTap: () {
              Provider.of<HomeViewModel>(context, listen: false).addSample();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.close, color: StyleConst().snsButtonFontColor),
            title: Text('Cancel',
                style: TextStyle(
                  color: StyleConst().snsButtonFontColor,
                )),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  ));
}
