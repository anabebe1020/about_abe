import '../importer.dart';

/// Languages common to all apps.
class Messages {
  Messages({
    this.title,
    this.homeTab,
    this.accountTab,
    this.discographyTab,
    this.setting,
    this.locale,
    this.japanese,
    this.english,
    this.darkMode,
    this.topix,
    this.followees,
    this.followers,
    this.overview,
    this.items,
    this.job,
    this.work,
    this.skills,
  });

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
        setting: '設定',
        locale: '言語切替',
        japanese: '日本語',
        english: '英語',
        darkMode: 'ダークモード',
        topix: 'トピックス',
        followees: 'フォロー',
        followers: 'フォロワー',
        items: '投稿',
        overview: '説明',
        job: '役割',
        work: '業務',
        skills: 'スキル',
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
        job: 'Position',
        work: 'Work',
        skills: 'Skills',
      );

  final String? title;
  final String? homeTab;
  final String? accountTab;
  final String? discographyTab;
  final String? setting;
  final String? locale;
  final String? japanese;
  final String? english;
  final String? darkMode;
  final String? topix;
  final String? followees;
  final String? followers;
  final String? items;
  final String? overview;
  final String? job;
  final String? work;
  final String? skills;
}

class AppLocalizations {
  AppLocalizations(Locale locale) : messages = Messages.of(locale);

  final Messages messages;

  static Messages of(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return localization!.messages;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(
    Locale locale,
  ) async =>
      AppLocalizations(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
