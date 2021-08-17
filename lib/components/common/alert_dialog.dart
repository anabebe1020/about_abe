import '../importer.dart';

/// Dialog for SNS duplicate.
Widget duplicateDialog(BuildContext context) {
  return AlertDialog(
    title: Text("追加済み"),
    content: Text("指定のSNSはすでに追加済みです。"),
    actions: <Widget>[
      TextButton(
        child: Text("OK"),
        onPressed: () => Navigator.pop(context),
      ),
    ],
  );
}
