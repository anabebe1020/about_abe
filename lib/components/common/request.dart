import '../importer.dart';
import 'package:http/http.dart' as http;

/// Http request common to all apps.
class HttpRequest {
  String content;
  final _url = SnsConst().qiitaUrl;
  final _token = '819ef4e03a5073fc5b72c2e75f277116a8fca0db';

  //
  void post(String path, Map params) async {
    Map<String, String> headers = {'content-type': 'application/json'};
    final uri = Uri.parse(_url + path);
    String body = json.encode({'name': 'moke'});

    http.Response resp = await http.post(uri, headers: headers, body: body);
    if (resp.statusCode == 200) {
      content = json.decode(resp.body);
    } else {
      throw Exception('Failed to post ${resp.statusCode}');
    }
    return;
  }

  //
  Future<String> get(String path) async {
    Map<String, String> headers = {
      'content-type': 'application/json',
      'Authorization': 'Bearer ${this._token}'
    };
    final uri = Uri.parse(_url + path);
    print('URI: $uri');
    http.Response resp = await http.get(uri, headers: headers);
    if (resp.statusCode == 200) {
      content = resp.body;
      //print('body: $content');
    } else {
      throw Exception('Failed to post ${resp.statusCode}');
    }
    return content;
  }
}
