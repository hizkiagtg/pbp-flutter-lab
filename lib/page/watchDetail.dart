import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/method/method.dart';
import 'package:counter_7/model/watchlistModel.dart';
import 'package:counter_7/page/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WatchDetail extends StatelessWidget {
  const WatchDetail({super.key, required this.watch});
  final Watchlist watch;

  @override
  Widget build(BuildContext context) {
    var formatter = new DateFormat('MMM d, yyyy');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: DrawerWidget(),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 197, 226, 255),
                Color.fromARGB(255, 255, 255, 255),
              ],
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.all(20),
          elevation: 20,
          color: Color.fromARGB(255, 100, 237, 205),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color.fromARGB(255, 1, 36, 70), width: 3),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          shadowColor: Color.fromARGB(255, 45, 168, 78),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(height: 30),
                  Text(
                    watch.fields.title,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  ListTile(
                    leading: const Text(
                      'Release Date: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      formatter.format(watch.fields.releaseDate).toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    dense: true,
                  ),
                  ListTile(
                    leading: const Text(
                      'Rating: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '${watch.fields.rating} / 5',
                      style: const TextStyle(fontSize: 20),
                    ),
                    dense: true,
                  ),
                  ListTile(
                    leading: const Text(
                      'Status: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      watch.fields.watched ? "Watched" : "Not Watched",
                      style: const TextStyle(fontSize: 20),
                    ),
                    dense: true,
                  ),
                  ListTile(
                      title: const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Review: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      dense: true,
                      subtitle: Text(
                        watch.fields.review,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      )),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                child: Text('Back'),
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 120.0, vertical: 25.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    primary: Colors.blue),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const WatchPage()),
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ]),
    );
  }
}
