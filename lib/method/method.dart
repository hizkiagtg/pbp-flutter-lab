import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/watchlistModel.dart';

Future<List<Watchlist>> fetch() async {
  var url = Uri.parse('https://tugas1pbp.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object watch
  List<Watchlist> watch = [];
  for (var d in data) {
    if (d != null) {
      watch.add(Watchlist.fromJson(d));
    }
  }
  return watch;
}
