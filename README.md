# Proyek Flutter PBP oleh Hizkia Sebastian Ginting

Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer Universitas Indonesia, Semester Ganjil 2022/2023

## Pendahuluan

Repositori ini merupakan suatu repositori saya untuk mengunggah tugas Flutter saya dalam mata kuliah Pemrograman Berbasis Platform

# Proyek Flutter 7 : Counter_7

## Perbedaan antara Stateless Widget dan Stateful Widget

Stateless widget adalah widget yang tidak pernah berubah (bersifat statis). Widget jenis ini memiliki konsep alur Constructor menuju Build. Artinya, widget akan langsung mengarahkan object untuk melakukan Build tanpa adanya perantara untuk melakukan perubahan dan pengolahan variabel. Selain itu, dalam prosesnya widget ini lebih mudah untuk dirender (tidak membutuhkan reload), dan bersifat cocok untuk widget dengan tanpa adanya perubahan data di dalamnya. Contoh dari widget ini adalah Icon, IconButton, dan Text.

Sedangkat, stateful widget bersifat dinamis, dan dapat berubah tampilan sesuai dengan event yang dipicu oleh pengguna ketika menerima data. Widget jenis ini memiliki konsep alur Constructor menuju Internal State menuju Build. Artinya, widget akan mengarahkan object terlebih dahulu melalui perantara Internal State untuk melakukan pengolahan data, dan state tersebut bersifat dinamis. State tersebut kemudian akan diolah lagi dan disesuaikan untuk ditampilkan saat proses Build. Berbeda dengan stateless widget, widget ini membutuhkan waktu tambahan untuk reload. Selain itu, widget ini cocok untuk widget yang bersifat dinamis dan membutuhkan pengolahan data yang interaktif. Contoh dari widget ini adalah Form, Radio, Slider, dan TextField.

## Penjelasan tentang Widget yang Digunakan Beserta Fungsi

Berikut widget yang saya gunakan:

| Widget | Fungsi |
| ----- | ----- |
| Scaffold | Mengatur layout basic dari widget dan isinya |
| AppBar | Menambahkan bar aplikasi yang berisi title dengan left alignment| 
| Text | Berisi sebuah Text yang dapat diatur propertintya|
| Center | Mengatur layout widget menjadi center |
| Column | Mengatur layout widget menjadi berbentuk kolom |
| Container | Menampung beberapa widget di dalamnya |
| Row | Mengatur layout widget menjadi berbentuk baris |
| FloatingActionButton | Membuat button yang dapat ditambahkan event di dalamnya |
| Visibility | Untuk mengatur visibility dari suatu widget (untuk hide widget) |
| Expanded | Untuk memperluas child dari Row |
| Padding | Untuk mengatur jarak dari dalam di widget |
| Icon | Untuk menampilkan icon sesuai properti |

## Penjelasan tentang setState() dan variabel yang Terdampak

Fungsi setState() merupakan suatu fungsi yang akan memberi tahu framework bahwa intrnal state telah berubah, sehingga framework akan mengatur ulang untuk melakukan Build (proses rebuild), terhadap State objek tersebut. Fungsi setState ini digunakan untuk stateful widget, yang sifatnya dinamis. Adapun variabel yang terdampak adalah variabel yang diletakkan di dalam fungsi tersebut. Dalam kasus saya, terdapat tiga buah variabel yang akan berubah dan akan di rebuild ketika ada perubahan, yaitu variabel _counter, _isEven, dan _visible.

## Perbedaan antara const dan final

Const merupakan jenis keyword yang dapat digunakan ketika ada deklarasi variabel yang bersifat immutable (tidak dapat diubah) dan sifatnya konstan. Keyword jenis ini akan akan dilakukan render setiap ada inisiasi ulang sesuai dengan nilainya, sehingga bersifat lebih fleksibel. Namun, dalam satu cycle program, nilai variabel const tidak dapat diubah.

Adapun Final adalah suatu keyword dengan sifat single-assingment. Artinya, ketika inisiasi, nilainya tidak dapat diubah walaupun dilakukan inisiasi / render ulang. Keyword jenis ini cocok terhadap data yang tidak berubah, bahkan ketika adanya proses render / reload.

## Implementasi Checklist

Terlebih dahulu, saya membuat app flutter dengan command berikut:
             `flutter create counter_7`

Kemudian, saya melakukan modifikasi pada `lib/main.dart` untuk menerapkan logic. Berikut prosesnya:

1. Membuat fungsi decrement untuk counter, sebagai berikut:
    ```dart
      void _decrementCounter() {
        setState(() {
        if (_counter <= 1) {
            _visible = false;
        } else {
            _visible = true;
        }
        _counter--;
        _changeBool();
        });
    }
    ```
    Adapun fungsi `_changeBool()` berfungsi untuk mengecek apakah bilangan genap atau tidak. Kalau `_counter % 2 == 1`, maka akan mengatur variabel `_isEven = false`, dan sebaliknya.

2. Berikutnya, akan menampilkan tulisan ganjil dan genap sesuai dengan logic seperti berikut:
    ```dart
        if (_isEven)
            Text('GENAP', style: TextStyle(color: Colors.red))
        else
            Text('GANJIL', style: TextStyle(color: Colors.blue)),
        Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
        ),
    ```
3. Selanjutnya, akan membuat dua button `floatingActionButton` menggunakan Row. Untuk soal bonus, maka pada bagian tombol decrement akan diatur Visibility nya. Ketika `_visible == true`, maka akan di-hide. Berikut implementasinya:
    ```dart
        floatingActionButton: Padding(
            padding: EdgeInsets.only(left: 30),
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
                Visibility(
                visible: _visible,
                child: FloatingActionButton(
                    onPressed: _decrementCounter,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                ),
                ),
                Expanded(child: Container()),
                FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
                ),
            ],
            ),
        ),
    ```

4. Setelah selesai, kemudian akan melakukan proses add, commit, dan push di git


# Proyek Flutter 8: Bugdeting App

## Perbedaan antara Navigator.push dan Navigator.pushReplacement

Ketika menggunakan `Navigator.push`, route yang ada di bawahnya akan tetap tersimpan dalam stack, sedangkan `Navigator.pushReplacment` akan membuang route yang ditimpa (menggantikannya).

## Penjelasan tentang Widget yang Digunakan Beserta Fungsi

Berikut widget yang saya gunakan:

| Widget | Fungsi |
| ----- | ----- |
| Scaffold | Mengatur layout basic dari widget dan isinya |
| AppBar | Menambahkan bar aplikasi yang berisi title dengan left alignment| 
| Text | Berisi sebuah Text yang dapat diatur propertintya|
| Center | Mengatur layout widget menjadi center |
| Column | Mengatur layout widget menjadi berbentuk kolom |
| Container | Menampung beberapa widget di dalamnya |
| Row | Mengatur layout widget menjadi berbentuk baris |
| Expanded | Untuk memperluas child dari Row |
| Padding | Untuk mengatur jarak dari dalam di widget |
| Icon | Untuk menampilkan icon sesuai properti |
| ListTile | Untuk membuat list dengan widget di dalamnya, dengan 1-3 line text |
| LinearGradient | Untuk membuat warna gradient dari perpaduan warna lain |
| BoxDecoration | Menyajikan cara untuk mengatur box, meliputi border, body, dsb |
| Form | Sebagai container untuk mengelompokkan dan men-validasi beberapa field input |
| SingleChildScrollView | Widget untuk memungkinkan scroll |
| Image.network | Untuk menampilkan gambar dari internet |
| TextFormField | Widget untuk input text pada form |
| InputDecoration | Untuk konfigurasi input text field (border, style, dsb) |
| IconData | Untuk menampilan icon (sama dengan widget icon) |
| ElevatedButton | Untuk membuat suatu button |
| RoundedRectangleBorder | Untuk membuat border pada widget |
| SizedBox | Widget kosong dengan ukuran yang dapat diatur |
| DropdownButton | Widget untuk menampilkan dropdown |
| Dialog | Widget untuk menampilkan dialog ketika suatu item di trigger |
| Stack | Widget untuk menampung beberapa content berupa stack |
| Card | Widget untuk menampung komponen dalam suatu card |

## Penjelasan tentang event pada Flutter

| Event | Fungsi |
| ----- | ----- |
| onPressed | Berfungsi untuk eksekusi ketika suatu tombol ditekan |
| onTap | Berfungsi untuk eksekusi user melakukan tabs pada object yang di render| 
| onSave | Berfungsi untuk save suatu form |
| onChange | Berfungsi untuk eksekusi user melakukan tabs pada object yang di render| 
| onHover | Melakukan hover ketika pointer menunjuk suatu widget |
| onEnter | Berfungsi untuk eksekusi user menekan enter | 
| onExit | Melakukan trigger ketika pointer melakukan exit di widget, ketika widget masih dimuat |


## Penjelasan cara kerja Navigator dalam mengganti halaman pada Flutter

Navigator akan mengelola halaman atau screen pada applikasi flutter dengan konsep stack. Jika seseorang menekan tombol, maka user akan dibawa ke halaman lain, sehingga secara general stack akan bertambah. Ketika user keluar dari screen, maka stack akan diperbaharui dengan melakukan pop pada stack.

## Implementasi Checklist

1. Membuat suatu file `form.dart` untuk membuat form judul, nominal, tanggal, dan jenis. Di file ini, di bagian atasnya akan dibuat suatu list untuk menampung object dari model, dan didefinisikan di luar kelas. Berikut tampilannya:
    ```dart
        List<Model> listModel = [];
    ```
    Ketika melakukan penyimpanan menggunakan onSaved, maka akan menambahkan objek model ke list tersebut.
2. Membuat suatu file `model.dart`, untuk membuat model berisi judul, nominal, tanggal, dan jenis. Berikut tampilan modelnya:
    ```dart
        class Model {
        String judul;
        String nominal;
        String jenis;
        String dateTime;

        Model(
            {required this.judul,
            required this.nominal,
            required this.jenis,
            required this.dateTime});
        }

    ```
3. Membuat suatu file untuk drawer yang akan dipakai dipakai di file lainnya.
4. Membuat suatu file `result.dart` untuk menampilkan isi dari `List<Model> listModel = []`. Akan dilakukan iterasi pada tiap elemen, dan akan ditampilkan dengan widget card.
4. Setelah selesai, kemudian akan melakukan proses add, commit, dan push di git

# Proyek Flutter 9: My Watch List App

## Penjelasan Apakah JSON dapat Dikembalikan Tanpa Membuat Model

Sebenarnya, kita dapat melakukan fetch terhadap data JSON secara langsung tanpa membuat model terlebih dahulu. Bila melakukan fetch secara langsung, maka JSON harus dibuat menjadi suatu dynamic map. Dynamic map tersebut kemudian dapat diakses seperti penggunaan map pada umumnya, yaitu dengan menggunakan pasangan key dan value. Walaupun dapat dilakukan dengan cara tersebut, tetapi hal tersebut tidak dianjurkan. Hal ini karena ada kemungkinan field yang dikecualikan atau field yang hilang, sehingga susah untuk menangani error atau masalah kedepannya. Sehingga, lebih baik bila menggunakan model terlebih dahulu.

## Penjelasan tentang Widget yang Digunakan Beserta Fungsi

Berikut widget yang saya gunakan:

| Widget | Fungsi |
| ----- | ----- |
| Checkbox | Widget untuk membuat suatu checkbox yang dapat di-klik |
| GestureDetector | Widget untuk mendeteksi aksi pada suatu widget |
| ElevatedButton | Untuk membuat suatu button |
| FutureBuilder | Widget yang dapat melakukan build terhadap dirinya sendiri terhadap snapshot aktivitas terakhir dengan Future|
| ListTile | Untuk membuat list dengan widget di dalamnya, dengan 1-3 line text |
| Scaffold | Mengatur layout basic dari widget dan isinya |
| AppBar | Menambahkan bar aplikasi yang berisi title dengan left alignment| 
| Text | Berisi sebuah Text yang dapat diatur propertintya|
| Center | Mengatur layout widget menjadi center |
| Column | Mengatur layout widget menjadi berbentuk kolom |
| Container | Menampung beberapa widget di dalamnya |
| LinearGradient | Untuk membuat warna gradient dari perpaduan warna lain |
| BoxDecoration | Menyajikan cara untuk mengatur box, meliputi border, body, dsb |
| InputDecoration | Untuk konfigurasi input text field (border, style, dsb) |
| RoundedRectangleBorder | Untuk membuat border pada widget |
| SizedBox | Widget kosong dengan ukuran yang dapat diatur |
| Dialog | Widget untuk menampilkan dialog ketika suatu item di trigger |
| Stack | Widget untuk menampung beberapa content berupa stack |
| Card | Widget untuk menampung komponen dalam suatu card |

## Penjelasan tentang Proses Fetching Data JSON

Awalnya, data di fetch dari fungsi `fetch`. Fungsi tersebut akan melakukan get dari HTTP. Kemudian, fungsi tersebut akan mengembalikan suatu objek dari model yang telah dibuat sebelumnya, dalam kasus ini objek `Wacthlist`. Kemudian, widget `FutureBuilder` akan melakukan pemanggilan terhadap fungsi `fetch`, kemudian menunggu terhadap respon tersebut. Ketika data di fetch, `FutureBuilder` tersebut akan mengembalikan suatu `ListView.builder`, yang berisi kumpulan `ListTiles`. `ListTiles` tersebut berisikan data yang sudah dipetakan dari fungsi `fetch`.

## Implementasi Checklist

1. Membuat suatu file `watchlist.dart` dan membuat suatu class `WatchPage` yang merupakan turunan dari `Stateful Widget`. 
2. Membuat suatu file `watchlistModel.dart`, untuk membuat model berisi fields yang dibutuhkan. Berikut tampilan modelnya:

    ```dart
        class Watchlist {
            Watchlist({
                required this.model,
                required this.pk,
                required this.fields,
            });

            String model;
            int pk;
            Fields fields;

            factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
                    model: json["model"],
                    pk: json["pk"],
                    fields: Fields.fromJson(json["fields"]),
                );

            Map<String, dynamic> toJson() => {
                    "model": this.model,
                    "pk": this.pk,
                    "fields": this.fields.toJson(),
                };
                }

        class Fields {
            Fields({
                required this.title,
                required this.watched,
                required this.rating,
                required this.releaseDate,
                required this.review,
            });

            String title;
            bool watched;
            int rating;
            DateTime releaseDate;
            String review;

            factory Fields.fromJson(Map<String, dynamic> json) => Fields(
                    title: json["title"],
                    watched: json["watched"],
                    rating: json["rating"],
                    releaseDate: DateTime.parse(json["release_date"]),
                    review: json["review"],
                );

            Map<String, dynamic> toJson() => {
                    "title": title,
                    "watched": watched,
                    "rating": rating,
                    "release_date":
                        "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
                    "review": review,
                };
            }
    ```
3. Membuat suatu file untuk fungsi `fetch` data JSON. Fungsi tersebut dibuat di `method.dart`. Berikut implementasinya:
    ```dart
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
    ```
4. Class `WatchPage` kemudian akan berisikan suatu widget `FututreBuilder`, yang kemudian nantinya akan melakukan fetch JSON dengan fungsi `fetch`. Kemudian, akan menampilkan semua judul JSON dengan widget `ListTiles`.
5. Kemudian, akan membuat suatu file baru yang berisikan detail dari watchlist, yaitu `watchDetail.dart`. File tersebut berisikan class `WatchDetail`, yang akan menerima parameter object `Watchlist` yaitu watch.
6. Akan menambahkan widget `GestureDetector` ketika melakukan tap pada suatu widget `ListTiles`. Kemudian, akan mengirim data yang di-tap ke halaman `WatchDetail`, serta akan menuju ke halaman `WatchDetail` dengan navigasi sebagai berikut:
    ```dart 
        itemBuilder: (_, index) => GestureDetector(
            onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WatchDetail(watch: snapshot.data![index])),
                );
            },
        )
    ```
    Di halaman `WatchDetail` akan ditambahkan tombol back, yang menavigasi ke halaman `WatchPage` bila ditekan.
7. Melakukan `git add - push - commit` terhadap perubahan yang dilakukan.


