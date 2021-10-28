import 'package:http/http.dart' as http;
import '../importer.dart';

/// Http request common to all apps.
class HttpRequest {
  dynamic content;
  //
  Future<void> post(Uri uri, Map<String, String> headers) async {
    if (headers.isEmpty) {
      headers['content-type'] = 'application/json';
    }
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
  Future<dynamic> get(Uri uri, Map<String, String> headers) async {
    if (headers.isEmpty) {
      headers['content-type'] = 'application/json';
    }
    final resp = await http.get(uri, headers: headers);
    if (resp.statusCode == 200) {
      content = resp.body;
    } else {
      throw Exception('Failed to post ${resp.statusCode}');
    }
    return content;
  }
}
