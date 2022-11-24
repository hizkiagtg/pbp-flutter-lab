import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/method/method.dart';
import 'package:counter_7/model/watchlistModel.dart';
import 'package:counter_7/page/watchDetail.dart';
import 'package:flutter/material.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({super.key});
  @override
  _WatchPageState createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: DrawerWidget(),
      body: Container(
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
        child: FutureBuilder(
          future: fetch(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada watch list :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WatchDetail(watch: snapshot.data![index])),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: snapshot.data![index].fields.watched
                              ? Color.fromARGB(255, 134, 235, 172)
                              : Color.fromARGB(255, 223, 245, 125),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: const [
                            BoxShadow(color: Colors.black, blurRadius: 2.0)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            activeColor: Color.fromARGB(255, 134, 235, 172),
                            checkColor: Colors.black,
                            focusColor: Color.fromARGB(255, 223, 245, 125),
                            value: snapshot.data![index].fields.watched!,
                            onChanged: (bool? value) {
                              setState(() {
                                snapshot.data![index].fields.watched = value!;
                              });
                            },
                          ),
                          Text(
                            "${snapshot.data![index].fields.title}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
