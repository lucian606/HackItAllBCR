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
        AppBar(centerTitle: true, title: const Text("Hack It All - BCR")),
        body: Column(children: <Widget>[
          Card(
              clipBehavior: Clip.antiAlias,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter company',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        var rng = new Random();
                        int n = rng.nextInt(10) + 5;
                        stockList.clear();
                        setState(() {
                          for (int i = 1; i <= n; i++) {
                            stockList.add(i);
                          }
                        });
                      },
                    )),
              )),
          Expanded(
              child: ListView.builder(
                itemCount: stockList.length,
                itemBuilder: (contex, index) {
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(child:
                          Column(children: [
                            ListTile(
                                title: Text(
                                    "STOCK " + stockList[index].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                    "Company: " + stockList[index].toString())),
                          ]),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(contex).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      StockScreen(message: "meow from stock: " + stockList[index].toString())));
                            },
                            icon: Icon(Icons.trending_up),
                            tooltip: 'Show Chart',
                          ),
                        ],
                      ));
                },
              ))
        ]));
  }
}
