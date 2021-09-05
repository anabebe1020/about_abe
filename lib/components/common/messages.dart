import '../importer.dart';

/// Languages common to all apps.
class Messages {
  Messages({
    @required this.title,
    @required this.title2,
    @required this.menu1,
    @required this.menu2,
    @required this.menu3,
    @required this.qiita,
    @required this.id,
    @required this.followees,
    @required this.followers,
    @required this.items,
    @required this.password,
    @required this.setting,
    @required this.locale,
    @required this.japanese,
    @required this.english,
  });

  final String title;
  final String title2;
  final String menu1;
  final String menu2;
  final String menu3;
  final String qiita;
  final String id;
  final String followees;
  final String followers;
  final String items;
  final String password;
  final String setting;
  final String locale;
  final String japanese;
  final String english;

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
        title2: 'Qiita View',
        menu1: '＋ボタンを押した回数',
        menu2: '次へ',
        menu3: '最後の画面だよ',
        qiita: 'Qiita',
        id: 'ID',
        followees: 'フォロー',
        followers: 'フォロワー',
        items: '投稿',
        password: 'Password',
        setting: '設定画面',
        locale: '言語設定',
        japanese: '日本語',
        english: '英語',
      );

  /// English
  factory Messages.en() => Messages(
        title: 'I\'m Abe',
        title2: 'Qiita View',
        menu1: 'num of touch, + button',
        menu2: 'next',
        menu3: 'the screen of last.',
        qiita: 'Qiita',
        id: 'ID',
        followees: 'Followees',
        followers: 'Followers',
        items: 'Items',
        password: 'Password',
        setting: 'Settings',
        locale: 'Locale',
        japanese: 'Japanese',
        english: 'English',
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
