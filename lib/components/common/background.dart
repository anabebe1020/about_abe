import '../importer.dart';

/// Background of this application.
class AppBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraint) {
      final height = contraint.maxHeight;
      final width = contraint.maxWidth;
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
