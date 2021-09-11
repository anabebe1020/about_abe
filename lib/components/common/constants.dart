import '../importer.dart';

/// Constants common to all apps.
class AppConst {
  final String title = 'I\'m Abe';
}

/// Constants for SNS.
class SnsConst {
  final String qiita = 'Qiita';
  final String qiitaUrl = 'https://qiita.com/api/v2';
}

Color mainLightColor = HexColor('E1F8FE'); // HexColor('B5F8FE');
Color mainDarkColor = HexColor('36558F');

/// Constants for style.
class StyleConst {
  // Common.
  //Color mainLightColor = HexColor('E1F8FE'); // HexColor('B5F8FE');
  //Color mainDarkColor = HexColor('36558F');
  // Theme Light.
  final Color appColorLight = mainLightColor;
  final Color appFontColorLight = mainDarkColor;
  final Color barColorLight = mainDarkColor;
  final Color barFontColorLight = mainLightColor;
  final Color topixButtonColorLight = Colors.white.withOpacity(0.9);
  final Color buttonColorLight = mainLightColor;
  // Theme Dark.
  final Color appColorDark = mainDarkColor;
  final Color appFontColorDark = mainLightColor;
  final Color barColorDark = mainLightColor;
  final Color barFontColorDark = mainDarkColor;
  final Color topixButtonColordark = Colors.black.withOpacity(0.9);
  final Color buttonColorDark = mainDarkColor;
  // Application
  final Color appBarColor = mainLightColor;
  final Color appBarTextColor = mainDarkColor;
  final String backgroundImagePath = 'images/background_image.jpg';
  final Color backgroundLightColor = mainLightColor;
  final Color backgroundDarkColor = mainDarkColor;
  // Floating Action Button.
  final Color faButtonColor1 = HexColor('ff7f7f');
  final Color faButtonColor2 = HexColor('BF7FFF');
  // Topix Tile.
  final double topixPaddingH = 50;
  final double topixPaddingV = 20;
  final double topixIconSize = 60;
  // SNS Button.
  final double snsButtonSize = 80;
  final double snsButtonHeight = 160; //120;
  final Color snaButtonColor = Colors.white.withOpacity(0.9);
  final double snsButtonFontSize = 16; //45;
  final Color snsButtonFontColor = mainDarkColor;
  final Color sampleButtonColor = Colors.white.withOpacity(0.9);
  final String qiitaIconPath = 'images/icon_qiita.png';
  final Color qiitaButtonColor = HexColor('9EFFCE').withOpacity(0.9);
  // Qiita View.
  final double qiitaDiscriptionFontSize = 20;
  // Other.
  final SizedBox verticalSeparator = SizedBox(width: 10);
  final SizedBox horizontalSeparator = SizedBox(height: 10);
}

/// Constants for routes.
class Routes {
  final String appHome = '/HomeScreen';
  final String setting = '/SettingScreen';
  final String locale = '/LocaleScreen';
  final String qiitaLogin = '/QiitaLoginScreen';
  final String qiitaView = '/QiitaScreen';
}

/// Get the [Color] class value from the hex color code.
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
