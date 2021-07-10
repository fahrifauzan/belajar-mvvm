import 'dart:convert';
import 'package:bljr_mvvm/core/model/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


class ApiServices extends ChangeNotifier{
  final String url = "http://newsapi.org/v2/top-headlines?country=id&q=corona&apiKey=f049bedc04b54902bb22039bfb45267b";
  Response response;

  Future<List<News>> getNews() async {
    try{
      var headers = {
          "Content-Type": "application/json",
          "Accept": "application/json",
        };
      Dio dio = new Dio();
      response = await dio.get(url,
        options: Options(
          headers: headers,
        )
      );
      if (response.statusCode == 200) {
        notifyListeners();
        Iterable data = response.data['articles'];
        List<News> listData = data.map((map) => News.fromJson(map)).toList();
        return listData;
      }else {
        print("error"+response.statusCode.toString());
      }
    }on DioError catch(e) {
      response = e.response;
    }
  }
}