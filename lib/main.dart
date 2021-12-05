import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'screens/search_screen.dart';
import 'providers/stock_data_provider.dart';
import 'providers/stock_list_provider.dart';

Future<void> doRequest() async {
  var url =
  Uri.https('yfapi.net', '/v8/finance/chart/MSFT', {'q': '{https}'});
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'X-API-KEY': 'OqJb1lVdPbOPW6bLJq3c1lXgnVAVHEJ1eX6fOFm3'
  };
  var response = await http.get(url, headers: requestHeaders);
  print(response.statusCode);
  if (response.statusCode == 200) {
    print(response.body);
  }
}

void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return const MaterialApp(
        home: SearchScreen(),
    );
  }
}
