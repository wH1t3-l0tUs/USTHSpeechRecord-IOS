import 'package:first_flutte_app/class/category.dart';

import "package:dio/dio.dart";

import "../class/domain.dart";

Dio dio = new Dio();
Future<List<Domain>> getCategories() async {
  try {
    String url = "https://voiceviet.itrithuc.vn/api/v1/domain/list/11/1";
    var response = await dio.get(url,
        options: Options(headers: {
          "Authorization-Key": "812f2448624c42899fbf794f54f591f9",
          "accept": "application/json; charset=utf-8"
        }));

    if (response.statusCode == 200) {
      return new List<Domain>.from(
          response.data['resp'].map((domain) => Domain.fromJson(domain)));
    }
    return <Domain>[];
  } catch (e) {
    // print(e);
    return <Domain>[];
  }
}
