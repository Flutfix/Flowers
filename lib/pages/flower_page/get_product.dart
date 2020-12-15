import 'dart:convert';

import 'package:flowers/pages/flower_page/get_product_serialise.dart';
import 'package:http/http.dart' as http;

// ignore: missing_return
Future<GetProduct> getProduct() async {
  try {
    final String url = 'http://192.168.50.117/api/product?id=80';

    var responce = await http.get(url);

    String jsonR = responce.body;

    Map<String, dynamic> jsonMap = json.decode(jsonR);

    GetProduct getProductClass = GetProduct.fromJson(jsonMap);

    return getProductClass;
  } catch (e) {}
}
