import 'dart:collection';
import 'package:http/http.dart' as http;
import 'dart:convert';

void auth(String _phone) async {
  try {
    final String url = 'http://192.168.50.117/api/auth';
    Map<String, dynamic> body = Map();
    body['phone_number'] = '8$_phone';

    Map<String, String> headers = HashMap();
    headers['Content-type'] = 'application/json';
    var response;
    response = await http.post(url,
        encoding: Encoding.getByName('utf-8'),
        body: json.encode(body),
        headers: headers);
  } catch (e) {
    print(e);
  }
}
