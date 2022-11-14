import 'package:counter_7/drawer.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyResultPage extends StatelessWidget {
  const MyResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Budget'),
      ),
      drawer: DrawerWidget(),
      body: Stack(
        children: [
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
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                for (var item in listModel)
                  Card(
                    margin: EdgeInsets.all(10),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(255, 171, 210, 249),
                            width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    shadowColor: Colors.green[100],
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                              IconData(0xe3f8, fontFamily: 'MaterialIcons'),
                              color: Colors.cyan,
                              size: 45),
                          title: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(item.judul,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20.0)),
                          ),
                          subtitle: Text(
                            'Nominal Anda            : ' +
                                item.nominal +
                                '\n' +
                                'Jenis budget Anda    : ' +
                                item.jenis +
                                '\n' +
                                'Tanggal budget          : ' +
                                item.dateTime,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
