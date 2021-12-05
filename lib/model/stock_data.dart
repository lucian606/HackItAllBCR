import 'dart:html';

import 'package:quiver/iterables.dart';
import 'package:tuple/tuple.dart';

class StockEntry {
  final int timestamp;
  final double low;
  final double high;
  final double open;
  final double close;

  StockEntry(this.timestamp, this.low, this.high, this.open, this.close);
}

class StockData
{
  final String currency;
  final String exchangeTimezoneName;

  final String symbol;

  final double regularMarketPrice;
  final Tuple2<int, int> preTradingPeriod;
  final Tuple2<int, int> inTradingPeriod;
  final Tuple2<int, int> postTradingPeriod;

  final List<StockEntry> entries;

  StockData(
      {
        required this.currency,
        required this.exchangeTimezoneName,
        required this.symbol,
        required this.regularMarketPrice,
        required this.preTradingPeriod,
        required this.inTradingPeriod,
        required this.postTradingPeriod,
        required this.entries,
  });

  factory StockData.fromJson(Map<String, dynamic> json) {

    final List<dynamic> timestamps = json['timestamp'];
    final List<dynamic> lows = json['indicators']['quote'][0]['low'];
    final List<dynamic> highs = json['indicators']['quote'][0]['high'];
    final List<dynamic> opens = json['indicators']['quote'][0]['open'];
    final List<dynamic> closes = json['indicators']['quote'][0]['close'];

    final List<StockEntry> entries = zip([timestamps,lows,highs,opens,closes]).map((item) => StockEntry(item[0], item[1], item[2], item[3], item[4])).cast<StockEntry>().toList();

    return StockData(
        currency: json['meta']['currency'],
        exchangeTimezoneName: json['meta']['exchangeTimezoneName'],
        symbol: json['meta']['symbol'],
        regularMarketPrice: json['meta']['regularMarketPrice'],
        preTradingPeriod: Tuple2(
            json['meta']['currentTradingPeriod']["pre"]["start"],
            json['meta']['currentTradingPeriod']["pre"]["end"]
        ),
        inTradingPeriod: Tuple2(
            json['meta']['currentTradingPeriod']["regular"]["start"],
            json['meta']['currentTradingPeriod']["regular"]["end"]
        ),
    postTradingPeriod: Tuple2(
            json['meta']['currentTradingPeriod']["post"]["start"],
            json['meta']['currentTradingPeriod']["post"]["end"]
        ),
    entries: entries,
    );
  }
}