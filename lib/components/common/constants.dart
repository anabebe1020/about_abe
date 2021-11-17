import '../importer.dart';

/// Constants common to all apps.
class AppConst {
  final String title = 'I\'m Abe';
}

/// Constants for SNS.
class SnsConst {
  final String qiita = 'Qiita';
  final String qiitaUrl = 'https://qiita.com/api/v2';
  final String getItemsUrl = '/authenticated_user/items?page=1&per_page=1';
  final String ghApiUrl = 'https://api.github.com';
  final String ghBaseUrl = 'https://github.com';
  final String twBaseUrl = 'https://twitter.com';
}

Color mainLightColor = HexColor('E1F8FE');
Color mainDarkColor = HexColor('36558F');

/// Constants for style.
class StyleConst {
  // Theme Light.
  final Color appColorLight = mainLightColor;
  final Color appFontColorLight = mainDarkColor;
  final Color barColorLight = mainDarkColor;
  final Color barFontColorLight = mainLightColor;
  final Color topixButtonColorLight = Colors.white.withOpacity(0.9);
  final Color topixFontColorLight = mainDarkColor;
  final Color buttonColorLight = mainLightColor;
  final Color unSelectedButtonColorLight = mainLightColor.withOpacity(0.3);
  // Theme Dark.
  final Color appColorDark = mainDarkColor;
  final Color appFontColorDark = mainLightColor;
  final Color barColorDark = Colors.black54.withOpacity(0.5);
  final Color barFontColorDark = mainDarkColor;
  final Color topixButtonColordark = Colors.black54.withOpacity(0.5);
  final Color topixFontColorDark = mainLightColor;
  final Color buttonColorDark = mainDarkColor;
  final Color unSelectedButtonColorDark = mainDarkColor.withOpacity(0.9);
  // Application
  final Color appBarColor = mainLightColor;
  final Color appBarTextColor = mainDarkColor;
  final String backgroundImagePath = 'assets/images/background_image.jpg';
  final Color backgroundLightColor = mainLightColor;
  final Color backgroundDarkColor = mainDarkColor;
  // Font
  final double appFontSizeSS = 8;
  final double appFontSizeS = 12;
  final double appFontSizeM = 16;
  final double appFontSizeL = 20;
  final double appFontSizeLL = 24;
  // Icon
  final double appIconSizeS = 14;
  final double appIconSizeM = 18;
  // Floating Action Button.
  final Color faButtonColor1 = HexColor('ff7f7f');
  final Color faButtonColor2 = HexColor('BF7FFF');
  // Topix Tile.
  final double topixPaddingH = 50;
  final double topixPaddingV = 20;
  final double topixIconSize = 60;
  // Account Page
  final double repoTileHeight = 160;
  final double repoTileWidth = 220;
  final double repoPaddingH = 10;
  final double repoPaddingV = 10;
  // SNS Button.
  final double snsButtonSize = 80;
  final double snsButtonHeight = 160; //120;
  final Color snaButtonColor = Colors.white.withOpacity(0.9);
  final double snsButtonFontSize = 16; //45;
  final Color snsButtonFontColor = mainDarkColor;
  final Color sampleButtonColor = Colors.white.withOpacity(0.9);
  final String qiitaIconPath = 'assets/images/icon_qiita.png';
  final Color qiitaButtonColor = HexColor('9EFFCE').withOpacity(0.9);
  // Qiita View.
  //final double qiitaDiscriptionFontSize = 20;
  // History View.
  final double historycompanyNameFontSize = 26;
  final double historyDiscriptionFontSize = 20;
  // Other.
  final SizedBox verticalSeparator = const SizedBox(width: 10);
  final SizedBox horizontalSeparator = const SizedBox(height: 10);
}

/// Constants for routes.
class Routes {
  final String appHome = '/HomeScreen';
  final String setting = '/SettingScreen';
  final String locale = '/LocaleScreen';
  final String qiitaLogin = '/QiitaLoginScreen';
  final String qiitaView = '/QiitaScreen';
}

class FirebaseConst {
  final String storeAccountConId = 'account';
  final String storeAccountDocId = 'Pg05rksGJ9EqzcOPSYa9';
  final String storeHistoryConId = 'discography';
  final String storeHistoryDocId = 'rVm8XbCfhJqL9q88iebh';
}

/// Get the [Color] class value from the hex color code.
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    var fixedHexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      fixedHexColor = 'FF$fixedHexColor';
    }
    return int.parse(fixedHexColor, radix: 16);
  }
}
