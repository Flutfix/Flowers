import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'flowers_home_model.dart';

Future<FlowersHome> getAllDBForFlowersHome() async {
  String url = 'http://192.168.50.117/api/products?per_page=8&page=1';
  Response responce = await http.get(url);

  try {
    Map<String, dynamic> flowersHomeDecode = json.decode(responce.body);
    FlowersHome db = FlowersHome.fromJson(flowersHomeDecode);
    return db;
  } catch (e) {
    return null;
  }
}

Future<FlowersHome> getBouqetsForFlowersHome() async {
  String url =
      'http://192.168.50.117/api/products?per_page=8&page=1&tab=букеты';
  Response responce = await http.get(url);

  try {
    Map<String, dynamic> flowersHomeDecode = json.decode(responce.body);
    FlowersHome db = FlowersHome.fromJson(flowersHomeDecode);
    return db;
  } catch (e) {
    return null;
  }
}

Future<FlowersHome> getFlowersForFlowersHome() async {
  String url = 'http://192.168.50.117/api/products?per_page=8&page=1&tab=цветы';
  Response responce = await http.get(url);

  try {
    Map<String, dynamic> flowersHomeDecode = json.decode(responce.body);
    FlowersHome db = FlowersHome.fromJson(flowersHomeDecode);
    return db;
  } catch (e) {
    return null;
  }
}
