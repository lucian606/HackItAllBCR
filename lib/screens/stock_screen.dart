import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_it_all_bcr/model/stock_data.dart';
import 'package:hack_it_all_bcr/providers/stock_data_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StockScreen extends StatefulWidget {

  const StockScreen({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {

  String range = "1mo";
  String interval = "1d";
  String region = 'United States';

  final Map<String,String> countryIds ={
    'United States' : 'US',
    'Autstralia' : 'AU',
    'Canada':'CA',
    'France' : 'FR',
    'Germany' : 'DE',
    'Hong Kong' : 'HK',
    'Italy' : 'IT',
    'Spain' : 'ES',
    'Great Britain' : 'GB',
    'India' : 'IN',
  };

  final List<String> countries = [
    'United States',
    'Autstralia' ,
    'Canada',
    'France' ,
    'Germany',
    'Hong Kong',
    'Italy',
    'Spain',
    'Great Britain' ,
    'India',
  ];

  void _incrementCounter() {
    setState(() {
    });
  }

  StockData stockData = StockData.fromJson(jsonDecode("{}"));

  Future<void> fetchChart() async{
    stockData = await StockDataProvider().doQuery(widget.message);
  }

  @override
  void initState() {
    super.initState();
    fetchChart();
  }

  List<DropdownMenuItem<String>> get ranges {
    return [
      const DropdownMenuItem(child: Text("1 Day"),value: "1d"),
      const DropdownMenuItem(child: Text("5 Days"),value: "5d"),
      const DropdownMenuItem(child: Text("1 Month"),value: "1mo"),
      const DropdownMenuItem(child: Text("3 Months"),value: "3mo"),
      const DropdownMenuItem(child: Text("6 Months"),value: "6mo"),
      const DropdownMenuItem(child: Text("1 Years"),value: "1y"),
      const DropdownMenuItem(child: Text("5 Years"),value: "5y"),
    ];
  }

  List<DropdownMenuItem<String>> get intervals {
    return [
      const DropdownMenuItem(child: Text("1 Minute"),value: "1m"),
      const DropdownMenuItem(child: Text("5 Minutes"),value: "5m"),
      const DropdownMenuItem(child: Text("15 Minutes"),value: "15m"),
      const DropdownMenuItem(child: Text("1 Day"),value: "1d"),
      const DropdownMenuItem(child: Text("1 Week"),value: "1wk"),
      const DropdownMenuItem(child: Text("1 Month"),value: "1mo"),
    ];
  }

  List<>

  @override
  Widget build(BuildContext context) {
    Paint circlePaint = Paint()..color = Colors.black;
    Paint insideCirclePaint = Paint()..color = Colors.white;
    Paint linePaint = Paint()
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..color = Colors.black;

    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
          ),
          body:ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      title: ChartTitle(text: 'Half yearly sales analysis'),
                      legend: Legend(isVisible: true,position: LegendPosition.bottom),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      isTransposed: false,
                      series: <ChartSeries<StockEntry, DateTime>>[
                        LineSeries<StockEntry, DateTime>(
                            dataSource: stockData.entries,
                            xValueMapper: (StockEntry entry, _) => DateTime.fromMillisecondsSinceEpoch(entry.timestamp * 1000 ),
                            yValueMapper: (StockEntry entry, _) => entry.high,
                            name: 'High',
                            dataLabelSettings: const DataLabelSettings(isVisible: true)),
                      ]
                  ),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.calendar_today,),
                      DropdownButton<String>(
                        value: range,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 0,
                        style: const TextStyle(color: Colors.blue),
                        underline: Container(
                          height: 2,
                          color: Colors.blue,
                        ),
                        onChanged: (String? newValue) {
                          setState(() async {
                            range = newValue!;
                            stockData = await StockDataProvider().doQuery(widget.message,range: range,interval: interval,region: countryIds[region]!);
                          });
                        },
                        items: ranges
                      ),
                      const Icon(Icons.calendar_today,),
                      DropdownButton<String>(
                        value: interval,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 0,
                        style: const TextStyle(color: Colors.blue),
                        underline: Container(
                          height: 2,
                          color: Colors.blue,
                        ),
                        onChanged: (String? newValue) {
                          setState(() async {
                            interval = newValue!;
                            stockData = await StockDataProvider().doQuery(widget.message,range: range,interval: interval,region: countryIds[region]!);
                          });
                        },
                        items: intervals,
                      ),
                      const Icon(Icons.public_rounded),
                      DropdownButton<String>(
                        value: region,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 0,
                        style: const TextStyle(color: Colors.blue),
                        underline: Container(
                          height: 2,
                          color: Colors.blue,
                        ),
                        onChanged: (String? newValue) {
                          setState(() async {
                            region = newValue!;
                            stockData = await StockDataProvider().doQuery(widget.message,range: range,interval: interval,region: countryIds[region]!);
                          });
                        },
                        items: countries
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],)
                ],
              ),
            ],
          ),
        )
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}