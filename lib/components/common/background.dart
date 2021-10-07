import '../importer.dart';

/// Background of this application.
class AppBackground extends StatelessWidget {
  const AppBackground({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraint) {
      final height = contraint.maxHeight;
      //final width = contraint.maxWidth;
      return Stack(
        children: <Widget>[
          Image.asset(
            StyleConst().backgroundImagePath,
            fit: BoxFit.fitHeight,
            height: height,
          )
        ],
      );
    });
  }
}
