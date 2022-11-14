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
| OutlineInputBorder |
| ElevatedButton |
| RoundedRectangleBorder |
| SizedBox |
| DropdownButton |
| Dialog |
| Stack |
| Card |
| BorderSize |

## Penjelasan tentang event pada Flutter


## Penjelasan cara kerja Navigator dalam mengganti halaman pada Flutter


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


