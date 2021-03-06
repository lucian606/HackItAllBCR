import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_it_all_bcr/model/company.dart';
import 'package:hack_it_all_bcr/providers/stock_list_provider.dart';
import '../providers/stock_list_provider.dart';
import 'stock_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> stockList = [];
  List<dynamic> trendingStocks = [];

  searchResultList(String stock) async {
    List<dynamic> resultsList = [];
    if (_searchController.text != "") {
      resultsList = await AutocompleteProvider().doQuery(stock);
    } else {
      await TrendingProvider("US").doQuery().then((trendingStocksJsons) {
        resultsList = trendingStocksJsons
            .map(
                (json) => Company(symbol: json["symbol"], name: json["symbol"]))
            .toList();
      });
    }
    setState(() {
      stockList = resultsList;
    });
  }

  @override
  void initState() {
    super.initState();
    TrendingProvider('US').doQuery().then((trendingStocksJsons) {
      setState(() {
        trendingStocks = trendingStocksJsons
            .map(
                (json) => Company(symbol: json["symbol"], name: json["symbol"]))
            .toList();
        stockList = trendingStocks;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        searchResultList(_searchController.text);
                      },
                    ),
                    hintText: 'Search...',
                    contentPadding: const EdgeInsets.all(16),
                    border: InputBorder.none),
              ),
            ),
          ),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: stockList.length,
            itemBuilder: (context, index) {
              return Card(
                  elevation: 0.0,
                  margin: const EdgeInsets.only(top: 8),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.6),
                      width: 2,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StockScreen(
                                message: stockList[index].symbol)));
                      },
                      icon: const Icon(
                        Icons.trending_up,
                        color: Colors.black87,
                      ),
                      tooltip: 'Show Chart',
                    ),
                    title: Text(
                      stockList[index].symbol,
                      style: const TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        const Icon(
                            IconData(0xe11b, fontFamily: 'MaterialIcons'),
                            color: Colors.blue),
                        Text(stockList[index].name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ));
            },
          ))
        ]));
  }
}
