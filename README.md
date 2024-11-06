# Welcome to Bonagit Store! :chocolate_bar:

<details>
<summary>
  <span style="font-size:16px;"><b>Getting Started</b></span>
</summary>
A new Flutter project.

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
</details>

<details>
<summary>
  <span style="font-size:16px;"><b>Tugas 7: Elemen Dasar Flutter</b></span>
</summary>

### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
- Stateless Widget adalah widget yang bersifat statis dan tidak dapat berubah selama aplikasi berjalan (setelah di-build). Stateless widget hanya dapat ditentukan oleh konfigurasi di dalam konstruktor. Contoh dari stateless widget adalah Text, Icon, Container, dll. Pada proyek ini contoh dari stateless widget adalah `InfoCard`

- Stateful widget adalah widget yang dapat berubah-ubah sesuai dengan keadaan atau interaksi pengguna. Widget ini memiliki objek `State` yang dapat diperbarui untuk memberitahu framework bahwa ada perubahan pada widget dan perlu dilakukan rebuild. Perubahan ini bisa berasal dari interaksi pengguna atau pembaruan data secara real-time. Contoh dari stateful widget adalah Checkbox, TextField, custom UI components, dll.

Perbedaan antara kedua widgets adalah stateless widget mudah dipahami tetapi memerlukan pembangunan ulang pada widget tree setiap kali ada perubahan. Di sisi lain, stateful widget memungkinkan perubahan pada state tanpa perlu rebuild seluruh widget tree. Perbedaan utamanya adalah stateless widget bersifat tidak dapat diubah setelah build sedangkan stateful widget memiliki `State` yang memungkinkan perubahan dan pembaruan UI selama runtime.

### 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
- `MaterialApp`: Widget root aplikasi yang mengatur tema, navigasi, dan pengaturan global lainnya.
- `Scaffold`: Memberikan kerangka dasar halaman untuk menyusun `AppBar`, `body`, dan pengaturan struktur halaman utama aplikasi.
- `AppBar`: Memberikan identitas aplikasi di bagian atas layar. Pada proyek ini menampilkan bagian atas halaman yang berjudul "Bonagit Store".
- `Padding`: Digunakan untuk memberikan jarak di sekitar elemen.
- `Column`: Menyusun widget secara vertikal.
- `Row`: Menyusun widget secara horizontal. Di proyek ini, `Row` digunakan untuk menampilkan tiga kartu informasi (NPM, Nama, Kelas) secara sejajar.
- `Card`: Menampilkan kotak dengan shadow untuk elemen informasi.
- `Container`: Widget serbaguna untuk mengatur tata letak, padding, margin, dan dekorasi. Dalam proyek ini, `Container` digunakan di dalam `Card` untuk mengatur padding dan ukuran elemen.
- `GridView.count`: Membuat grid yang digunakan untuk menampilkan elemen dalam layout grid. Di proyek ini, `GridView.count` digunakan untuk menampilkan tiga tombol (Lihat Daftar Produk, Tambah Produk, Logout) dalam tata letak grid 3 kolom.
- `InkWell`: Memberikan efek sentuhan interaktif pada `ItemCard`. Ketika pengguna mengetuk tombol, `InkWell` memberikan efek animasi dan men-trigger aksi seperti menampilkan `SnackBar`.
- `SnackBar`: Menampilkan notifikasi sementara di bagian bawah layar ketika tombol ditekan, seperti pesan "Kamu telah menekan tombol Lihat Daftar Produk".
- `Icon`: Menampilkan ikon di dalam widget.
- `Text`: Menampilkan teks.
- `Center`: Widget untuk memposisikan child di tengah-tengah parent.
- `SizedBox`: Widget untuk memberi jarak atau mengatur ukuran tetap pada elemen.
- `MediaQuery`: Widget yang digunakan untuk mendapatkan ukuran dan orientasi layar, berguna untuk membuat desain yang responsif.

### 3. Apa fungsi dari `setState()?` Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi `setState()` digunakan untuk memberitahu framework bahwa ada perubahan pada `State` dari widget dan perlu dilakukan rebuild agar UI diperbarui. Ketika `setState()` dipanggil, hanya bagian dari widget yang dipengaruhi oleh perubahan tersebut yang akan di-rebuild.

Variabel yang terdampak adalah semua variabel yang dideklarasikan dalam objek `State` yang digunakan di dalam metode `build()` untuk menentukan tampilan widget.

### 4. Jelaskan perbedaan antara `const` dengan `final`.
- `const` digunakan untuk mendeklarasikan nilai yang bersifat konstan, harus diketahui saat compile-time, dan berlaku secara immutabel di seluruh aplikasi. Objek `const` tidak dapat berubah dan lebih efisien karena diinisialisasi sebagai objek yang di-cache.
- `final` digunakan untuk variabel yang hanya dapat diinisialisasi sekali. Nilai dari variabel `final` tidak dapat diubah setelah diinisialisasi, tetapi nilai ini bisa ditentukan saat runtime.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan _checklist-checklist_ di atas.
Pertama, saya membuat proyek Flutter baru dengan nama bonagit_store di lokal menggunakan perintah `flutter create bonagit_store`, lalu saya masuk ke direktori proyek tersebut dengan menjalankan `cd bonagit_store`. Aplikasi ini bertema e-commerce sesuai dengan tugas-tugas yang telah saya kerjakan sebelumnya.

Selanjutnya, saya menambahkan file baru bernama `menu.dart` di dalam folder `lib` dan melakukan penataan kode agar lebih terstruktur dan rapi, mengikuti Tutorial 6 yang sudah dipelajari.

Setelah itu, saya mulai membuat tiga tombol sederhana dengan ikon dan teks, yaitu `Lihat Daftar Produk`, `Tambah Produk`, dan `Logout`. Sebelumnya, saya mendefinisikan kelas `ItemHomepage` untuk menyimpan informasi tiap tombol. Kelas `ItemHomepage` ini berisi nama, ikon, dan warna yang akan digunakan oleh masing-masing tombol, dengan format berikut:
```
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}
```

Tentu, berikut ini adalah parafrase dari langkah-langkah implementasi proyek Anda:

Pertama, saya membuat proyek Flutter baru dengan nama bonagit_store di lokal menggunakan perintah flutter create bonagit_store, lalu saya masuk ke direktori proyek tersebut dengan menjalankan cd bonagit_store. Aplikasi ini bertema e-commerce sesuai dengan tugas-tugas yang telah saya kerjakan sebelumnya.

Selanjutnya, saya menambahkan file baru bernama menu.dart di dalam folder lib dan melakukan penataan kode agar lebih terstruktur dan rapi, mengikuti panduan yang sudah dipelajari.

Setelah itu, saya mulai membuat tiga tombol sederhana dengan ikon dan teks, yaitu Lihat Daftar Produk, Tambah Produk, dan Logout. Sebelumnya, saya mendefinisikan kelas ItemHomepage untuk menyimpan informasi tiap tombol. Kelas ItemHomepage ini berisi nama, ikon, dan warna yang akan digunakan oleh masing-masing tombol, dengan format berikut:

dart
Copy code
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}
Kemudian, saya membuat daftar items di dalam `MyHomePage` yang terdiri dari tiga objek `ItemHomepage`, masing-masing dengan ikon dan warna yang telah ditentukan untuk setiap tombol, seperti ini:
```
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.shopping_bag),
    ItemHomepage("Tambah Produk", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];
```
Selanjutnya, saya membuat widget stateless bernama `ItemCard` yang akan menerima satu objek `ItemHomepage` sebagai parameter dan menampilkannya sebagai tombol pada layar.

Untuk menampilkan pesan snackbar saat tombol ditekan, saya menggunakan `ScaffoldMessenger.of(context)`. Widget `ScaffoldMessenger` ini berfungsi untuk mengelola tampilan `Snackbar` di aplikasi. Setelah mendapatkan instance dari `ScaffoldMessenger`, saya menggunakan metode `showSnackBar` untuk menampilkan `Snackbar` di layar. Untuk menampilkan pesan tersebut, saya membuat objek `SnackBar` yang berisi teks atau widget lain sesuai kebutuhan. Saya menambahkan kode `onTap` untuk memicu pesan `Snackbar` setiap kali tombol ditekan, dengan contoh implementasi sebagai berikut:
```
onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
```
Terakhir, saya menampilkan tombol-tombol tersebut dalam `GridView` di dalam `MyHomePage`, sehingga `ItemCard` dapat ditampilkan dalam tata letak berbentuk grid.
</details>