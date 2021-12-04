import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'package:http/http.dart' as http;

import 'screens/search_screen.dart';
import 'dart:convert' as convert;

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

Future<void> setupApi() async {
  AmplifyAPI apiPlugin = AmplifyAPI();
  AmplifyDataStore datastorePlugin = AmplifyDataStore(
    modelProvider: ModelProvider.instance,
  );
  Amplify.addPlugins([
    datastorePlugin,
    apiPlugin,
  ]);
  try {
    await Amplify.configure(amplifyconfig);
  } catch (e) {
    print(
        "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
  }
}

void main() {
  runApp(const MyApp());
}

Future<void> doSomething() async {
  final item = CompanyModelCDGP(
      name: "Tesla lui Elon Musca", value: 69.420666);
  await Amplify.DataStore.save(item);
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
