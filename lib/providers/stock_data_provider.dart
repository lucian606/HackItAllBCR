import 'dart:convert';
import 'package:hack_it_all_bcr/model/stock_data.dart';
import 'package:http/http.dart' as http;

class StockDataProvider {

  String range = '1mo';
  String region = 'US';
  String interval = '1d';

  Future<StockData> doQuery(String stock)
  async {
    final queryParameters = {
      'range': range,
      'region': region,
      'interval': interval,
      'lang': 'en',
      'events':'div',
      'stock': stock
    };
    var url =
    Uri.http('54.195.17.145:3000', '/chart' ,queryParameters);

    Map<String, String> requestHeaders = {
      'Access-Control-Allow-Origin': '*',
    };

    var response = await http.get(url,headers: requestHeaders);

    final json = jsonDecode(response.body);
    final stockJson = json["chart"]["result"][0];
    return StockData.fromJson(stockJson);
  }
}