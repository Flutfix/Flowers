import 'package:flowers/pages/login/get_token_serialise.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

getToken(String _phone, String _verificationCode) async {
  try {
    final String url =
        'http://192.168.50.117/api/get-token?phone_number=8$_phone&verification_code=$_verificationCode';
    var response = await http.get(url);
    String jsonR = response.body;
    Map<String, dynamic> jsonMap = json.decode(jsonR);
    String result;
    if (response.statusCode == 201) {
      TokenSerialise myClass = TokenSerialise.fromJson(jsonMap);
      result = myClass.token;
      // getdata(result);
    } else {
      ErrorConfirmNumber myClass = ErrorConfirmNumber.fromJson(jsonMap);
      result = myClass.error;
    }
    return result;
  } catch (e) {
    print(e);
  }
}

// getdata(String token) async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   preferences.setString('token', token);
//   String value = preferences.getString('token');
//   print("value = $value");
// }
