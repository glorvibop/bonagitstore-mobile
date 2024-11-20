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
- `GridView.count`: Membuat grid yang digunakan untuk menampilkan elemen dalam layout grid. Di proyek ini, `GridView.count` digunakan untuk menampilkan tiga tombol (Lihat Daftar Chocolate, Tambah Produk, Logout) dalam tata letak grid 3 kolom.
- `InkWell`: Memberikan efek sentuhan interaktif pada `ItemCard`. Ketika pengguna mengetuk tombol, `InkWell` memberikan efek animasi dan men-trigger aksi seperti menampilkan `SnackBar`.
- `SnackBar`: Menampilkan notifikasi sementara di bagian bawah layar ketika tombol ditekan, seperti pesan "Kamu telah menekan tombol Lihat Daftar Chocolate".
- `Icon`: Menampilkan ikon di dalam widget.
- `Text`: Menampilkan teks.
- `Center`: Widget untuk memposisikan child di tengah-tengah parent.
- `SizedBox`: Widget untuk memberi jarak atau mengatur ukuran tetap pada elemen.
- `MediaQuery`: Widget yang digunakan untuk mendapatkan ukuran dan orientasi layar, berguna untuk membuat desain yang responsif.

### 3. Apa fungsi dari `setState()?` Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi `setState()` digunakan untuk memberitahu framework bahwa ada perubahan pada `State` dari widget dan perlu dilakukan rebuild agar UI diperbarui. Ketika `setState()` dipanggil, hanya bagian dari widget yang dipengaruhi oleh perubahan tersebut yang akan di-rebuild.

Variabel yang terdampak adalah semua variabel yang dideklarasikan dalam objek `State` yang digunakan di dalam metode `build()` untuk menentukan tampilan widget.

### 4. Jelaskan perbedaan antara `const` dengan `final`.
- `const` digunakan untuk mendeklarasikan nilai yang bersifat konstan, harus diketahui saat compile-time, dan berlaku secara immutable di seluruh aplikasi. Objek `const` tidak dapat berubah dan lebih efisien karena diinisialisasi sebagai objek yang di-cache.
- `final` digunakan untuk variabel yang hanya dapat diinisialisasi sekali. Nilai dari variabel `final` tidak dapat diubah setelah diinisialisasi, tetapi nilai ini bisa ditentukan saat runtime.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan _checklist-checklist_ di atas.
Pertama, saya membuat proyek Flutter baru dengan nama bonagit_store di lokal menggunakan perintah `flutter create bonagit_store`, lalu saya masuk ke direktori proyek tersebut dengan menjalankan `cd bonagit_store`. Aplikasi ini bertema e-commerce sesuai dengan tugas-tugas yang telah saya kerjakan sebelumnya.

Selanjutnya, saya menambahkan file baru bernama `menu.dart` di dalam folder `lib` dan melakukan penataan kode agar lebih terstruktur dan rapi, mengikuti Tutorial 6 yang sudah dipelajari.

Setelah itu, saya mulai membuat tiga tombol sederhana dengan ikon dan teks, yaitu `Lihat Daftar Chocolate`, `Tambah Chocolate`, dan `Logout`. Sebelumnya, saya mendefinisikan kelas `ItemHomepage` untuk menyimpan informasi tiap tombol. Kelas `ItemHomepage` ini berisi nama, ikon, dan warna yang akan digunakan oleh masing-masing tombol, dengan format berikut:
```
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}
```

Kemudian, saya membuat daftar items di dalam `MyHomePage` yang terdiri dari tiga objek `ItemHomepage`, masing-masing dengan ikon dan warna yang telah ditentukan untuk setiap tombol, seperti ini:
```
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Chocolate", Icons.food_bank, const Color.fromARGB(255, 102, 67, 31)),
    ItemHomepage("Tambah Chocolate", Icons.add, const Color.fromARGB(255, 30, 32, 147)),
    ItemHomepage("Logout", Icons.logout, const Color.fromARGB(255, 123, 9, 21)),
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

<details>
<summary>
  <span style="font-size:16px;"><b>Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements</b></span>
</summary>

### 1. Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
`const` digunakan untuk membuat objek atau variabel yang bersifat immutable dan dihitung pada waktu kompilasi. Objek yang dibuat menggunakan const tidak dapat diubah setelah didefinisikan.

- Keuntungan Menggunakan `const`:
  - Objek `const` disimpan di memori hanya sekali, sehingga mengurangi alokasi memori saat aplikasi berjalan. Ini meningkatkan efisiensi memori dan performa aplikasi.
  - Karena objek dihitung saat waktu kompilasi, aplikasi berjalan lebih cepat karena tidak perlu membuat ulang objek tersebut setiap kali widget di-render.
  - Menggunakan `const` menunjukkan dengan jelas bahwa sebuah objek tidak akan berubah, membuat kode lebih mudah dipahami.

Kita sebaiknya menggunakan `const` untuk widget atau objek yang tidak berubah selama runtime aplikasi. Misalnya, ketika mendefinisikan teks, padding, atau ikon yang bersifat tetap. Contoh penggunaan const yang tepat berdasarkan proyek ini adalah:
```
...
     appBar: AppBar(
        title: const Text(
          'Bonagit Store',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
...
```

Pada kode di atas, `const` digunakan pada `Text` dan `IconThemeData` karena teks "Bonagit Store" dan ikon warna putih tidak akan berubah selama aplikasi berjalan. Sebaliknysa, `const` tidak disarankan jika widget atau objek memerlukan data dinamis yang dapat berubah selama runtime, seperti data yang diperoleh dari API atau masukan pengguna, contohnya seperti `TextFormField` pada `chocolate_card.dart`

### 2. Jelaskan dan bandingkan penggunaan _Column_ dan _Row_ pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
Kita dapat memanfaatkan widget _Column_ dan _Row_ untuk mengatur tata letak widget.
- `Column`: Menyusun widget secara vertikal. Di proyek ini, `Column` digunakan pada `Form Page` untuk menyusun elemen-elemen pada halaman formulir sehingga elemen input dan tombol tersusun rapi dalam satu arah vertikal:
```
...
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Name: $_name'),
    Text('Price: $_price'),
    Text('Description: $_description'),
    Text('Type: $_type'),
    Text('Cocoa Ratio: $_cocoaRatio'),
    Text('Amount: $_amount'),
  ],
),
...
```
- `Row`: Menyusun widget secara horizontal. Di proyek ini, `Row` digunakan untuk menampilkan tiga kartu informasi (NPM, Nama, Kelas) secara sejajar:
```
...
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InfoCard(title: 'NPM', content: npm),
    InfoCard(title: 'Name', content: name),
    InfoCard(title: 'Class', content: className),
  ],
),
...
```

### 3.  Sebutkan apa saja elemen input yang kamu gunakan pada halaman _form_ yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada halaman form di `chocolateentry_form.dart`, saya menggunakan `TextFormField` untuk menangani input data seperti *name*, *price*, *description*, *type*, *cocoa ratio*, dan *amount*, dengan validasi di setiap elemen. Pemilihan `TextFormField` memungkinkan fleksibilitas untuk input teks dan angka, serta memastikan data yang dimasukkan sesuai format yang diharapkan melalui validasi yang mencegah kesalahan input. Namun, terdapat beberapa elemen input Flutter yang tidak saya gunakan untuk proyek ini seperti `DropdownButtonFormField`, `Checkbox`, `Radio`, `Slider`, dan lain lain. Elemen-elemen tersebut tidak relevan dengan kebutuhan form ini, yang hanya memerlukan input teks dan angka.

### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Di file `main.dart`, saya mengatur tema (theme) aplikasi menggunakan `ThemeData` dalam widget `MaterialApp` pada properti `theme`. Saya menerapkan `colorScheme` dengan menggunakan `ColorScheme.fromSeed` dan memilih warna utama `Colors.deepPurple`, serta mengaktifkan `useMaterial3`. Dengan cara ini, saya memastikan bahwa aplikasi memiliki tema yang konsisten di seluruh bagian, sehingga tampilannya tetap seragam dan terorganisir.

### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Dalam proyek ini, saya menangani navigasi antar halaman menggunakan widget `Navigator`. Saya memanfaatkan fungsi seperti `Navigator.push()` untuk menambahkan halaman baru ke tumpukan dan `Navigator.pop()` untuk kembali ke halaman sebelumnya. Selain itu, saya menggunakan `Navigator.pushReplacement()` saat ingin mengganti halaman yang sedang ditampilkan tanpa menambahkannya ke tumpukan. Untuk mempermudah navigasi, saya juga menambahkan sebuah drawer yang memudahkan pengguna berpindah antara halaman utama dan halaman form. Tombol pada halaman utama diimplementasikan dengan `Navigator` untuk mengarahkan pengguna ke halaman form saat tombol tersebut ditekan.
</details>

<details>
<summary>
  <span style="font-size:16px;"><b>Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter</b></span>
</summary>

### 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Kita perlu membuat model dalam Flutter untuk memetakan data JSON yang diambil dari atau dikirim ke web service ke dalam bentuk objek Dart. Model ini berfungsi sebagai struktur yang membantu aplikasi memahami dan mengakses data secara terorganisir. Dengan menggunakan model, kita dapat mengelola data dengan lebih mudah, seperti membaca, menulis, atau memanipulasi data menggunakan properti dan metode yang didefinisikan dengan baik.

Jika kita tidak membuat model dan langsung mengakses data JSON sebagai peta (map) biasa, kita mungkin masih bisa memproses data. Namun, pendekatan ini lebih rentan terhadap kesalahan, seperti `TypeError` atau akses properti yang salah, terutama jika struktur data berubah atau tidak sesuai dengan yang diharapkan. Menggunakan model membuat data lebih aman untuk diakses dan lebih mudah untuk di-debug karena struktur dan tipe data didefinisikan dengan jelas.

### 2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library http digunakan untuk mengirimkan request HTTP dari aplikasi Flutter ke web service. Dalam tugas ini, library http bertanggung jawab untuk melakukan operasi seperti GET, POST, dan jenis request lainnya ke server Django yang di-hosting. http memungkinkan aplikasi Flutter mengambil data (GET) dari server (seperti data JSON) dan mengirimkan (POST) data ke server untuk berbagai operasi, seperti autentikasi, pembuatan product entry, atau pengambilan daftar product entry.

### 3. Jelaskan fungsi dari `CookieRequest` dan jelaskan mengapa _instance_ `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` adalah sebuah class dalam package `pbp_django_auth` yang menangani pengelolaan sesi dan cookie selama proses autentikasi dengan server Django. `CookieRequest` mempermudah pengelolaan permintaan HTTP dengan mempertahankan cookie sesi dan memungkinkan aplikasi untuk tetap terautentikasi setelah login.

Pentingnya membagikan _instance_ `CookieRequest` ke semua komponen aplikasi adalah karena data autentikasi dan sesi perlu diakses secara global. Dengan membagikan _instance_ `CookieRequest` menggunakan `Provider`, semua widget di tree aplikasi Flutter dapat mengakses dan menggunakan informasi sesi yang sama. Hal ini memastikan bahwa sesi pengguna tetap konsisten di semua bagian aplikasi, seperti saat melakukan pengambilan data setelah login, tanpa perlu membuat ulang _instance_ `CookieRequest`.

### 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Pengguna memasukkan data ke dalam `TextField` atau `FormField` di aplikasi Flutter, seperti informasi login atau product entry. Kemudian, data tersebut dikumpulkan dan dikonversi ke format JSON sebelum dikirim ke server Django menggunakan `http` atau `CookieRequest` dengan metode `POST`. Setelah menerima permintaan, server Django memproses data tersebut dengan menyimpannya ke dalam database atau memvalidasi kredensial. Lalu, response akan dikembalikan dalam bentuk JSON. Aplikasi Flutter kemudian menerima response ini, mengonversinya kembali menjadi objek model Dart dengan metode `fromJson`, dan memperbarui UI menggunakan widget seperti `Text`, `ListView`, atau `Card` untuk menampilkan informasi tersebut kepada pengguna.

### 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
- Login
Pengguna memasukkan `username` dan `password` di aplikasi Flutter, lalu data tersebut dikirim ke server Django menggunakan `CookieRequest` ke endpoint `login/`. Server Django memverifikasi kredensial dengan fungsi `login` dan jika valid, membuat sesi pengguna menggunakan `auth_login` sebelum mengirimkan response JSON berisi status dan pesan. Flutter menampilkan pesan sukses dan mengarahkan pengguna ke halaman utama jika login berhasil.

- Register
Pengguna memasukkan `username`, `password`, dan confirm `password`, kemudian data ini dikirim ke endpoint `register/` di Django dengan metode POST. Server Django memeriksa apakah `username` sudah terdaftar dan memastikan `password` yang dimasukkan cocok. Lalu, server Django akan membuat pengguna baru jika valid. Setelah itu, Django mengembalikan response JSON yang menginformasikan apakah registrasi berhasil atau gagal, dan Flutter menampilkan hasilnya kepada pengguna.

### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
Pertama, saya mengimplementasikan fitur registrasi akun di Flutter dengan memulai dari proyek Django. Saya membuat aplikasi baru bernama `authentication` dalam proyek Django saya (Bonagit Store), lalu mengatur semua konfigurasi yang diperlukan, seperti menambahkan authentication ke `INSTALLED_APPS` di `settings`.py, menginstal `django-cors-headers`, dan memperbarui `requirements.txt`. Saya juga menambahkan middleware CORS untuk memungkinkan komunikasi antara aplikasi Flutter dan Django. Setelah itu, saya membuat method `login` dan register di `views.py `pada aplikasi `authentication`, dengan routing diatur pada `urls.py.`

Setelah konfigurasi Django selesai, saya beralih ke aplikasi Flutter dan menambahkan dependensi provider dan `pbp_django_auth` untuk memfasilitasi autentikasi. Saya memodifikasi `main.dart` untuk membagikan _instance_ `CookieRequest` ke seluruh widget aplikasi menggunakan `Provider`. Kemudian, saya membuat file `login.dart` di folder `screens` untuk menampilkan halaman login, yang berisi formulir input untuk username dan password. Tombol login dikonfigurasi untuk mengirim data ke server Django dan menampilkan pesan sukses atau error menggunakan `ScaffoldMessenger`. Selanjutnya, saya menambahkan halaman registrasi (`register.dart`) yang memungkinkan pengguna baru membuat akun, dengan permintaan data yang dikirim ke endpoint registrasi Django.

Untuk mengelola data yang diambil dari Django, saya membuat model kustom. Saya membuka situs web Quicktype untuk mengonversi JSON dari endpoint Django ke dalam kode model Dart yang saya simpan di folder `models` sebagai `chocolate_entry.dart` Model ini digunakan untuk memetakan properti data seperti name, price, description, dan lainnya. Untuk menampilkan daftar product, saya membuat file `list_productentry.dart` di `screens` dan menambahkan kode untuk melakukan permintaan GET menggunakan `CookieRequest`. Saya memastikan halaman daftar product ini hanya menampilkan product milik pengguna yang sedang login. Setiap product dapat ditekan, membuka halaman detail product yang memuat informasi tambahan seperti type chocolate dan cocoa ratio.

Saya membuat halaman detail product (`product_detail.dart`) yang memuat informasi lengkap tentang product tertentu, seperti name, price, (chocolate) type, description, dan cocoa ratio. Data untuk halaman ini diambil dari server Django dengan fungsi `fetchProductDetail`, yang mengirimkan permintaan GET ke endpoint spesifik berdasarkan ID. Saya memastikan setiap product pada halaman daftar product dapat ditekan untuk membuka halaman detail menggunakan `Navigator.push`, dan halaman detail memiliki tombol back untuk kembali ke daftar.

Untuk memungkinkan pengguna menambahkan produk baru, saya membuat form di `chocolateentry_form.dart` dan menghubungkannya ke fungsi `create_product_flutter` di `views.py` Django. Data form dikirim ke server dan ditampilkan kembali di daftar produk. Terakhir, saya menambahkan fitur logout, di mana saya mengimplementasikan fungsi logout di Django dan menyesuaikan Flutter untuk menghapus sesi pengguna, mengarahkan pengguna kembali ke halaman login, dan menampilkan pesan sukses logout.
</details>