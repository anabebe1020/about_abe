import 'package:http/http.dart' as http;
import '../importer.dart';

/// Http request common to all apps.
class HttpRequest {
  dynamic content;
  final _url = SnsConst().qiitaUrl;
  final _token = '819ef4e03a5073fc5b72c2e75f277116a8fca0db';

  //
  Future<void> post(String path) async {
    final headers = <String, String>{'content-type': 'application/json'};
    final uri = Uri.parse(_url + path);
    final body = json.encode({'name': 'moke'});

    final resp = await http.post(uri, headers: headers, body: body);
    if (resp.statusCode == 200) {
      content = json.decode(resp.body);
    } else {
      throw Exception('Failed to post ${resp.statusCode}');
    }
    return;
  }

  //
  Future<dynamic> get(String path) async {
    final headers = <String, String>{'content-type': 'application/json', 'Authorization': 'Bearer $_token'};
    final uri = Uri.parse(_url + path);
    //print('URI: $uri');
    final resp = await http.get(uri, headers: headers);
    if (resp.statusCode == 200) {
      content = resp.body;
      //print('body: $content');
    } else {
      throw Exception('Failed to post ${resp.statusCode}');
    }
    return content;
  }
}
