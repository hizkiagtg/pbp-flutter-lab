import 'package:counter_7/drawer.dart';
import 'package:counter_7/model.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

List<Model> listModel = [];

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  String _nominal = "";
  String _jenis = "Pemasukan";
  DateTime date = DateTime.now();
  List<String> jenisBudget = ["Pemasukan", "Pengeluaran"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Budget'),
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(8, 30, 8, 69),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.network(
                      'https://cdn-icons-png.flaticon.com/512/2535/2535012.png',
                      height: 130,
                      fit: BoxFit.fill),
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Judul",
                        // Menambahkan icon agar lebih intuitif
                        icon: const Icon(
                            IconData(0xf520, fontFamily: 'MaterialIcons')),
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Judul Tidak Boleh Kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nominal",
                        // Menambahkan icon agar lebih intuitif
                        icon: const Icon(
                            IconData(0xf8cf, fontFamily: 'MaterialIcons')),
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          _nominal = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _nominal = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nominal tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    child: Text('Pilih Tanggal'),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 120.0, vertical: 25.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: Colors.blue),
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100));
                      if (newDate == null) return;
                      setState(() => date = newDate);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButton(
                    value: _jenis,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: jenisBudget.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _jenis = newValue!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 85,
                  ),
                  ElevatedButton(
                    child: Text('Simpan'),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 135.0, vertical: 25.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: Colors.blue),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var formatter = new DateFormat('MMM d, yyyy');
                        String formattedDate = formatter.format(date);
                        final budget = Model(
                            judul: _judul,
                            nominal: _nominal,
                            jenis: _jenis,
                            dateTime: formattedDate);
                        listModel.add(budget);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor:
                                  Color.fromARGB(255, 171, 210, 249),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: Container(
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20, right: 50, left: 50),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Center(
                                        child: const Text(
                                            'Berhasil menambahkan data Budget')),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      child: Text('Kembali'),
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 120.0,
                                              vertical: 25.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          primary: Colors.blue),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
