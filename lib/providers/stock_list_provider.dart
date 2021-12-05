
import 'package:http/http.dart' as http;
import 'dart:convert';


class TrendingProvider {
  String region = 'US';

  Future<void> doQuery()
  async {

    var url =
    Uri.http('54.195.17.145:3000', '/trending', {'region':region} );
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'X-API-KEY': 'OqJb1lVdPbOPW6bLJq3c1lXgnVAVHEJ1eX6fOFm3'
    };
    var response = await http.get(url, headers: requestHeaders);

    final json = jsonDecode(response.body);
    final results = List.from(json["finance"]["result"][0]["quotes"]);
  }
}

class AutocompleteProvider {
  Future<void> doQuery(String query)
  async {

    final queryParameters = {
      'region': 'US',
      'lang':'en',
      'query': query
    };

    var url =
    Uri.http('54.195.17.145:3000', '/autocomplete', queryParameters);
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'X-API-KEY': 'OqJb1lVdPbOPW6bLJq3c1lXgnVAVHEJ1eX6fOFm3'
    };
    var response = await http.get(url, headers: requestHeaders);

    final json = jsonDecode(response.body);
    final results = List.from(json["ResultSet"]["Result"]);
  }
}