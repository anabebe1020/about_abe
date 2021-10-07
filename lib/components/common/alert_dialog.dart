import '../importer.dart';

/// Dialog for SNS duplicate.
Widget duplicateDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('追加済み'),
    content: const Text('指定のSNSはすでに追加済みです。'),
    actions: <Widget>[
      TextButton(
        child: const Text('OK'),
        onPressed: () => Navigator.pop(context),
      ),
    ],
  );
}
