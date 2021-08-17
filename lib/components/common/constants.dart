import '../importer.dart';

/// Constants common to all apps.

/// Constants for SNS.
class SnsConst {
  final String qiita = 'Qiita';
  final String qiitaUrl = 'https://qiita.com/api/v2';
}

/// Constants for style.
class StyleConst {
  // Application.
  final Color appBarColor = HexColor('36558F');
  final Color appBarTextColor = HexColor('B5F8FE');
  final String backgroundImagePath = 'images/background_image.jpg';
  final Color backgroundLightColor = HexColor('B5F8FE');
  final Color backgroundDarkColor = HexColor('36558F');
  // Floating Action Button.
  final Color faButtonColor1 = HexColor('ff7f7f');
  final Color faButtonColor2 = HexColor('BF7FFF');
  // SNS Button.
  final double snsButtonSize = 80;
  final double snsButtonHeight = 120;
  final Color sampleButtonColor = Colors.white.withOpacity(0.9);
  final Color qiitaButtonColor = HexColor('9EFFCE').withOpacity(0.9);
  final double snsButtonFontSize = 45;
  final Color snsButtonFontColor = HexColor('36558F');
}

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