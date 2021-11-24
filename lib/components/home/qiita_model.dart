//import '../importer.dart';

class QiitaItemsModel {
  QiitaItemsModel(this._imageUrl, this._title, this._url);
  QiitaItemsModel.fromJson(dynamic json) {
    final lst = json.cast<String, dynamic>() as Map<String, dynamic>;
    _title = lst['title'].toString();
    _url = lst['url'].toString();
    _imageUrl = lst['profile_image_url'].toString();
    _lgtm = lst['likes_count'] as int;
  }
  //
  String _imageUrl = '';
  String get imageUrl => _imageUrl;
  int _lgtm = 0;
  int get lgtm => _lgtm;
  String _title = '';
  String get title => _title;
  String _url = '';
  String get url => _url;
}
