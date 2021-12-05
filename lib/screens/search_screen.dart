import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'stock_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<int> stockList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:
        AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true, title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      var rng = Random();
                      int n = rng.nextInt(10) + 5;
                      stockList.clear();
                      setState(() {
                        for (int i = 1; i <= n; i++) {
                          stockList.add(i);
                        }
                      });
                    },
                  ),
                  hintText: 'Search...',
                  contentPadding: const EdgeInsets.all(16),
                  border: InputBorder.none
              ),
            ),
          ),
        ),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: stockList.length,
                itemBuilder: (contex, index) {
                  return Card(
                      elevation: 0.0,
                      margin: const EdgeInsets.only(top:8),
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.0),
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        leading: IconButton(
                          onPressed: () {
                            Navigator.of(contex).push(
                                MaterialPageRoute(builder: (context) => StockScreen(message: "meow from stock: " + stockList[index].toString())));},
                          icon: const Icon(
                            Icons.trending_up,
                            color: Colors.black87,
                          ),
                          tooltip: 'Show Chart',
                        ),
                        title: Text(
                          "STOCK " + stockList[index].toString(),
                          style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            const Icon(IconData(0xe11b, fontFamily: 'MaterialIcons'), color: Colors.blue),
                            Text( stockList[index].toString(), style: const TextStyle(color: Colors.black54,fontWeight:FontWeight.bold))
                          ],
                        ),
                      )
                  );
                },
              ))
        ]));
  }
}
