import '../importer.dart';

/// Languages common to all apps.
class Messages {
  Messages({
    @required this.title,
    @required this.homeTab,
    @required this.accountTab,
    @required this.discographyTab,
    @required this.setting,
    @required this.locale,
    @required this.japanese,
    @required this.english,
    @required this.darkMode,
    @required this.topix,
    @required this.followees,
    @required this.followers,
    @required this.overview,
    @required this.items,
  });

  final String title;
  final String homeTab;
  final String accountTab;
  final String discographyTab;
  final String setting;
  final String locale;
  final String japanese;
  final String english;
  final String darkMode;
  final String topix;
  final String followees;
  final String followers;
  final String items;
  final String overview;

  factory Messages.of(Locale locale) {
    switch (locale.languageCode) {
      case 'ja':
        return Messages.ja();
      case 'en':
        return Messages.en();
      default:
        return Messages.ja();
    }
  }

  /// Japanese
  factory Messages.ja() => Messages(
        title: 'I\'m Abe',
        homeTab: 'ホーム',
        accountTab: 'アカウント',
        discographyTab: '略歴',
        setting: '設定画面',
        locale: '言語設定',
        japanese: '日本語',
        english: '英語',
        darkMode: 'ダークモード',
        topix: 'トピックス',
        followees: 'フォロー',
        followers: 'フォロワー',
        items: '投稿',
        overview: '説明',
      );

  /// English
  factory Messages.en() => Messages(
        title: 'I\'m Abe',
        homeTab: 'Home',
        accountTab: 'Account',
        discographyTab: 'Discography',
        setting: 'Settings',
        locale: 'Locale',
        japanese: 'Japanese',
        english: 'English',
        darkMode: 'Dark Mode',
        topix: 'Topix',
        followees: 'Followees',
        followers: 'Followers',
        items: 'Items',
        overview: 'overview',
      );
}

class AppLocalizations {
  final Messages messages;

  AppLocalizations(Locale locale) : this.messages = Messages.of(locale);

  static Messages of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations).messages;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async => AppLocalizations(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
