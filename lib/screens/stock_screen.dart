import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_it_all_bcr/model/stock_data.dart';
import 'package:hack_it_all_bcr/providers/stock_data_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tuple/tuple.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  String range = "1mo";
  String interval = "1d";
  String region = 'US';


  StockData stockData = StockData(
      currency: "",
      exchangeTimezoneName: "",
      symbol: "",
      regularMarketPrice: 0.0,
      preTradingPeriod: Tuple2(0, 0),
      inTradingPeriod: Tuple2(0, 0),
      postTradingPeriod: Tuple2(0, 0),
      entries: []);

  Future<void> fetchChart() async {
    var aux = await StockDataProvider().doQuery(widget.message);
    setState(() {
      stockData = aux;
    });
  }

  @override
  void initState() {
    fetchChart();
    super.initState();
  }

  List<DropdownMenuItem<String>> get ranges {
    return [
      const DropdownMenuItem(child: Text("1 Day"), value: "1d"),
      const DropdownMenuItem(child: Text("5 Days"), value: "5d"),
      const DropdownMenuItem(child: Text("1 Month"), value: "1mo"),
      const DropdownMenuItem(child: Text("3 Months"), value: "3mo"),
      const DropdownMenuItem(child: Text("6 Months"), value: "6mo"),
      const DropdownMenuItem(child: Text("1 Years"), value: "1y"),
      const DropdownMenuItem(child: Text("5 Years"), value: "5y"),
    ];
  }

  List<DropdownMenuItem<String>> get intervals {
    return [
      const DropdownMenuItem(child: Text("5 Minutes"), value: "5m"),
      const DropdownMenuItem(child: Text("15 Minutes"), value: "15m"),
      const DropdownMenuItem(child: Text("1 Day"), value: "1d"),
      const DropdownMenuItem(child: Text("1 Week"), value: "1wk"),
      const DropdownMenuItem(child: Text("1 Month"), value: "1mo"),
    ];
  }

  List<DropdownMenuItem<String>> get regions {
    return [
      const DropdownMenuItem(child: Text("United States"), value: "US"),
      const DropdownMenuItem(child: Text("Australia"), value: "AU"),
      const DropdownMenuItem(child: Text("Canada"), value: "CA"),
      const DropdownMenuItem(child: Text("France"), value: "FR"),
      const DropdownMenuItem(child: Text("Germany"), value: "DE"),
      const DropdownMenuItem(child: Text("Hong Kong"), value: "HK"),
      const DropdownMenuItem(child: Text("Italy"), value: "IT"),
      const DropdownMenuItem(child: Text("Spain"), value: "ES"),
      const DropdownMenuItem(child: Text("Great Britain"), value: "GN"),
      const DropdownMenuItem(child: Text("India"), value: "IN"),
    ];
  }

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
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      title: ChartTitle(text: 'Data for the selected stock'),
                      legend: Legend(
                          isVisible: true, position: LegendPosition.bottom),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      isTransposed: false,
                      series: <ChartSeries<StockEntry, DateTime>>[
                        LineSeries<StockEntry, DateTime>(
                            dataSource: stockData.entries,
                            xValueMapper: (StockEntry entry, _) =>
                                DateTime.fromMillisecondsSinceEpoch(
                                    entry.timestamp * 1000),
                            yValueMapper: (StockEntry entry, _) => entry.high,
                            name: 'High',
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: false)),
                        LineSeries<StockEntry, DateTime>(
                            dataSource: stockData.entries,
                            xValueMapper: (StockEntry entry, _) =>
                                DateTime.fromMillisecondsSinceEpoch(
                                    entry.timestamp * 1000),
                            yValueMapper: (StockEntry entry, _) => entry.low,
                            name: 'Low',
                            dataLabelSettings:
                            const DataLabelSettings(isVisible: false)),
                        LineSeries<StockEntry, DateTime>(
                            dataSource: stockData.entries,
                            xValueMapper: (StockEntry entry, _) =>
                                DateTime.fromMillisecondsSinceEpoch(
                                    entry.timestamp * 1000),
                            yValueMapper: (StockEntry entry, _) => entry.open,
                            name: 'Open',
                            dataLabelSettings:
                            const DataLabelSettings(isVisible: false)),
                        LineSeries<StockEntry, DateTime>(
                            dataSource: stockData.entries,
                            xValueMapper: (StockEntry entry, _) =>
                                DateTime.fromMillisecondsSinceEpoch(
                                    entry.timestamp * 1000),
                            yValueMapper: (StockEntry entry, _) => entry.close,
                            name: 'Close',
                            dataLabelSettings:
                            const DataLabelSettings(isVisible: false)),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(
                          value: interval,
                          onChanged: ((String? newValue) async {
                            if(newValue!.contains('5'))
                                range='1mo';
                            var aux = await StockDataProvider().doQuery(widget.message,region: region,range: range,interval: newValue);
                            setState(() {
                              interval = newValue;
                              stockData = aux;
                            });
                          }),
                          items: intervals),
                      DropdownButton(
                          value: range,
                          onChanged: ((String? newValue) async {
                            if((newValue!.contains('mo') || newValue.contains('y')) && interval.contains('5'))
                              interval='1d';

                            var aux = await StockDataProvider().doQuery(widget.message,region: region,range: newValue,interval: interval);
                            setState(() {
                              range = newValue;
                              stockData = aux;
                            });
                          }),
                          items: ranges),
                      DropdownButton(
                          value: region,
                          onChanged: ((String? newValue) async {
                            var aux = await StockDataProvider().doQuery(widget.message,region: newValue!,range: range,interval: interval);
                            setState(() {
                              region = newValue;
                              stockData = aux;
                            });
                          }),
                          items: regions),

                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
