import 'dart:convert';
import '../class/response.dart';

import 'package:http/http.dart';
import "package:dio/dio.dart";

Dio dio = new Dio();
Future<RandomText> getText() async {
  try {
    String url = "https://voiceviet.itrithuc.vn/api/v1/text/category/3/random";
    var response = await dio.get(url,
        options: Options(headers: {
          "Authorization-Key": "812f2448624c42899fbf794f54f591f9",
          "accept": "application/json; charset=utf-8"
        }));

    // var response = await get(url, headers: {
    //   "Authorization-Key": "812f2448624c42899fbf794f54f591f9",
    //   "accept": "application/json; charset=utf-8"
    // });
    if (response.statusCode == 200) {
      return RandomText.fromJson(response.data);
    } else {
      throw Exception('Faile to load');
    }
  } catch (e) {
    print(e);
  }
}
