import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:newsapp2/models/NewsData.dart';
import 'package:newsapp2/models/SourcesResponse.dart';

class APIManger {
  static Future<SourcesResponse> getSources(String category) async {
    Uri uri = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "ce383a42d9b7459d93e0815bcfd5bd16", "category": category});
    Response response = await http.get(uri);

    var jsonData = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonData);
    return sourcesResponse;
  }

  static Future<NewsDataModel> getNews(String sourceId,
      {String? search}) async {
    Uri uri = Uri.https("newsapi.org", "/v2/everything", {
      "apiKey": "ce383a42d9b7459d93e0815bcfd5bd16",
      "sources": sourceId,
      "q": search
    });
    Response response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(jsonData);
    return newsDataModel;
  }
}
