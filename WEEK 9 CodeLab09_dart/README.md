# Praktikum 1: Dasar State dengan Model-View

## Langkah 1: Buat Project Baru
Buatlah sebuah project flutter baru dengan nama master_plan di folder src week-10 repository 
GitHub Anda atau sesuai style laporan praktikum yang telah disepakati. Lalu buatlah susunan folder dalam project seperti gambar berikut ini.

![1.png](img/1.png)
![2.png](img/2.png)

## Langkah 2: Membuat model task.dart

Praktik terbaik untuk memulai adalah pada lapisan data (data layer). Ini akan memberi Anda gambaran yang jelas tentang aplikasi Anda, 
tanpa masuk ke detail antarmuka pengguna Anda. Di folder model, buat file bernama task.dart dan buat class Task. Class ini memiliki atribut description dengan tipe data String dan complete dengan tipe data Boolean, 
serta ada konstruktor. Kelas ini akan menyimpan data tugas untuk aplikasi kita. Tambahkan kode berikut: 

```dart
class Task {
  final String description;
  final bool complete;
  
  const Task({
    this.complete = false,
    this.description = '',
  });
}
```
#### Code Penjelasan
![3.png](img/3.png)

## Langkah 3: Buat file plan.dart
Kita juga perlu sebuah List untuk menyimpan daftar rencana dalam aplikasi to-do ini. Buat file plan.dart di dalam folder models dan isi kode seperti berikut.
```dart
import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});
}
```
#### Code Penjelasan
![4.png](img/4.png)


## Langkah 4: Buat file data_layer.dart
Kita dapat membungkus beberapa data layer ke dalam sebuah file yang nanti akan mengekspor kedua model tersebut. Dengan begitu, 
proses impor akan lebih ringkas seiring berkembangnya aplikasi. Buat file bernama data_layer.dart di folder models. Kodenya hanya berisi export seperti berikut.

```dart
export 'plan.dart';
export 'task.dart';
```
#### Code Penjelasan
![img.png](img/img.png)

## Langkah 5: Pindah ke file main.dart
Hapus semua kode yang ada di dalam main.dart dan ganti dengan kode ini

```dart
import 'package:flutter/material.dart';
import './views/plan_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(primarySwatch: Colors.purple),
     home: PlanScreen(), 
    );
  }
}
```
**#### Code Penjelasan**
![4.png](img/4.png)

## Langkah 6: buat plan_screen.dart
Pada folder views, buatlah sebuah file plan_screen.dart dan gunakan templat StatefulWidget untuk membuat class PlanScreen. 
Isi kodenya adalah sebagai berikut. Gantilah teks ‘Namaku' dengan nama panggilan Anda pada title AppBar.

````dart
import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
   
    appBar: AppBar(title: const Text('Master Plan Muhammad Rifda Musyaffa')),
    body: _buildList(), 
    floatingActionButton: _buildAddTaskButton(), 
   );
  }
}
````

**#### Code Penjelasan**
![5.png](img/5.png)

## Langkah 7: buat method _buildAddTaskButton()
Anda akan melihat beberapa error di langkah 6, karena method yang belum dibuat.
Ayo kita buat mulai dari yang paling mudah yaitu tombol Tambah Rencana. Tambah
kode berikut di bawah method build di dalam class _PlanScreenState.

```dart
Widget _buildAddTaskButton() {
    return FloatingActionButton(
     child: const Icon(Icons.add),
     onPressed: () {
       setState(() {
        plan = Plan(
         name: plan.name,
         tasks: List<Task>.from(plan.tasks)
         ..add(const Task()),
       );
      });
     },
    );
  }
```

**#### Code Penjelasan**
![img.png](img/6.png)

## Langkah 8: buat widget _buildList()
Kita akan buat widget berupa List yang dapat dilakukan scroll, yaitu ListView.builder.
Buat widget ListView seperti kode berikut ini.
```dart
Widget _buildList() {
    return ListView.builder(
     itemCount: plan.tasks.length,
     itemBuilder: (context, index) =>
     _buildTaskTile(plan.tasks[index], index), 
    );
  }
```

**#### Code Penjelasan**
![7.png](img/7.png)

## Langkah 9: buat widget _buildTaskTile()
Dari langkah 8, kita butuh ListTile untuk menampilkan setiap nilai dari plan.tasks. Kita
buat dinamis untuk setiap index data, sehingga membuat view menjadi lebih mudah. Tambahkan kode berikut ini

```dart
Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            setState(() {
              plan = Plan(
                name: plan.name,
                tasks: List<Task>.from(plan.tasks)
                  ..[index] = Task(
                    description: task.description,
                    complete: selected ?? false,
                  ),
              );
            });
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
          });
        },
      ),
    );
  }
```

**#### Code Penjelasan**
![8.png](img/8.png)

## Langkah 10: Tambah Scroll Controller
Anda dapat menambah tugas sebanyak-banyaknya, menandainya jika sudah beres, dan melakukan scroll jika sudah semakin banyak isinya. Namun, ada salah satu fitur tertentu di iOS perlu kita tambahkan. Ketika keyboard tampil, Anda akan kesulitan untuk mengisi yang paling bawah. Untuk mengatasi itu, 
Anda dapat menggunakan ScrollController untuk menghapus focus dari semua TextField selama event scroll dilakukan. Pada file plan_screen.dart, tambahkan variabel scroll controller di class State tepat setelah variabel plan.

```dart
late ScrollController scrollController;
```
**#### Code Penjelasan**
![img.png](img/9.png)

## Langkah 11: Tambah Scroll Listener'

Tambahkan method initState() setelah deklarasi variabel scrollController seperti kode berikut.

```dart
@override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }
```
**#### Code Penjelasan**
![img.png](img/10.png)

## Langkah 12: Tambah controller dan keyboard behavior
Tambahkan controller dan keyboard behavior pada ListView di method _buildList seperti kode berikut ini.

```dart
return ListView.builder(
  controller: scrollController,
 keyboardDismissBehavior: Theme.of(context).platform ==
 TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
```

**#### Code Penjelasan**
![img.png](img/11.png)

## Langkah 13: Terakhir, tambah method dispose()

Terakhir, tambahkan method dispose() berguna ketika widget sudah tidak digunakan lagi.

```dart
@override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
```

**#### Code Penjelasan**
![img.png](img/12.png)

## HASIL
![HASIL.png](img/HASIL.png)

## Tugas Praktikum 1: Dasar State dengan Model-View
Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki.

Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?

Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?

Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?

Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !

### Jawab:
1. Maksud dari Langkah 4 (data_layer.dart)
Langkah 4 adalah praktik pengorganisasian kode yang baik. File data_layer.dart dibuat sebagai file "pembungkus" (exporter).
Isinya hanya:
```dart
export 'plan.dart';
export 'task.dart';
```

Mengapa dilakukan demikian?
Tujuannya adalah untuk menyederhanakan proses import di file lain.

* Tanpa data_layer.dart: Jika file plan_screen.dart membutuhkan kedua model, Anda harus mengimpornya satu per satu:
```dart
import '../models/plan.dart';
import '../models/task.dart';
```
* Dengan data_layer.dart: Anda hanya perlu mengimpor satu file:
```dart
import '../models/data_layer.dart';
```
Ini membuat kode lebih bersih dan mudah dikelola, terutama saat aplikasi berkembang dan jumlah model bertambah.

2. Variabel plan di Langkah 6 

Mengapa perlu variabel plan?
Variabel plan (Plan plan = const Plan();) adalah state (data) utama untuk halaman PlanScreen. 
Variabel inilah yang menyimpan semua informasi yang perlu ditampilkan di layar, yaitu daftar tugas (List<Task>).

* _buildList() membaca dari variabel plan ini untuk tahu tugas apa saja yang harus ditampilkan.
* _buildAddTaskButton() memodifikasi variabel plan untuk menambah tugas baru.
* _buildTaskTile() juga memodifikasi variabel plan untuk memperbarui status tugas (misalnya menandai tugas sebagai selesai atau mengubah deskripsi tugas).

Mengapa dibuat const Plan()?
Membuatnya sebagai const Plan() memberikan beberapa keuntungan:
* Immutability: Objek Plan yang dibuat dengan const bersifat immutable (tidak dapat diubah). Ini membantu mencegah perubahan tidak sengaja pada data, yang penting dalam manajemen state.
  * Performance: Objek const dapat dioptimalkan oleh Dart, sehingga penggunaan memori menjadi
  * lebih efisien.
  * Predictability: Dengan menggunakan const, Anda memastikan bahwa objek Plan awal selalu dalam keadaan default (kosong), sehingga memudahkan debugging dan pengujian.
  * Konsistensi: Setiap kali Anda membuat Plan baru tanpa parameter, Anda mendapatkan instance yang sama, yang dapat membantu dalam perbandingan dan pengujian.
  * Best Practice: Menggunakan const untuk objek yang tidak perlu diubah adalah praktik yang baik dalam pemrograman Dart/Flutter, karena membantu menjaga kode tetap bersih dan efisien.

3. Hasil dari Langkah 9 (Simulasi GIF)
   Saya tidak dapat membuat file GIF, tetapi saya akan menjelaskan apa yang akan Anda lihat di hasil Langkah 9 jika Anda merekamnya:

4. Kegunaan Method initState dan dispose
Kedua method ini adalah bagian penting dari "Siklus Hidup" (Lifecycle) sebuah StatefulWidget.
* initState():
  * Kegunaan: Method ini dipanggil sekali ketika State objek dibuat. Ini adalah tempat yang tepat untuk menginisialisasi data atau sumber daya yang dibutuhkan oleh widget.
  * Dalam konteks praktikum, initState() digunakan untuk menginisialisasi ScrollController dan menambahkan listener padanya. Listener ini akan merespons event scroll dengan menghapus fokus dari semua TextField, yang penting untuk pengalaman pengguna di iOS.
dispose() (Langkah 13)
  * Kegunaan: Method ini dipanggil ketika State objek akan dihapus dari pohon widget. Ini adalah tempat yang tepat untuk membersihkan sumber daya yang tidak lagi dibutuhkan.
  * Dalam konteks praktikum, dispose() digunakan untuk membuang (dispose) ScrollController ketika widget tidak lagi digunakan. Ini penting untuk mencegah memory leaks, karena ScrollController mungkin masih mendengarkan event scroll bahkan setelah widget dihapus jika tidak dibuang dengan benar.
Dengan menggunakan initState() dan dispose() dengan benar, Anda memastikan bahwa sumber daya dikelola dengan baik, yang meningkatkan kinerja aplikasi dan mencegah potensi masalah memori.

## Praktikum 2: Mengelola Data Layer dengan InheritedWidget dan InheritedNotifier
Bagaimana seharusnya Anda mengakses data pada aplikasi?

Beberapa pilihan yang bisa dilakukan adalah meletakkan data dalam satu kelas yang sama sehingga menjadi bagian dari life cycle aplikasi Anda.

Kemudian muncul pertanyaan, bagaimana meletakkan model dalam pohon widget ? sedangkan model bukanlah widget, sehingga tidak akan tampil pada screen.

Solusi yang memungkinkan adalah menggunakan InheritedWidget. Sejauh ini kita hanya menggunakan dua jenis widget, yaitu StatelessWidget dan StatefulWidget. Kedua widget tersebut digunakan untuk layouting UI di screen. Di mana satu bersifat statis dan dinamis. 
Sedangkan InheritedWidget itu berbeda, ia dapat meneruskan data ke sub-widget turunannya (biasanya ketika Anda menerapkan decomposition widget). Jika dilihat dari perspektif user, itu tidak akan terlihat prosesnya (invisible). InheritedWidget dapat digunakan sebagai pintu untuk komunikasi antara view dan data layers.

Pada codelab ini, kita akan memperbarui kode dari aplikasi Master Plan dengan memisahkan data todo list ke luar class view-nya.

Setelah Anda menyelesaikan praktikum 1, Anda dapat melanjutkan praktikum 2 ini. Selesaikan langkah-langkah praktikum berikut ini menggunakan editor Visual Studio Code (VS Code) atau Android Studio atau code editor lain kesukaan Anda.

## Langkah 1: Buat file plan_notifier.dart
Buat folder baru provider di dalam folder lib, lalu buat file baru dengan nama plan_provider.dart berisi kode seperti berikut.

![img.png](img.png)

**Code Penjelasan**
```dart
import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
  const PlanProvider({super.key, required Widget child, required
   ValueNotifier<Plan> notifier})
  : super(child: child, notifier: notifier);

  static ValueNotifier<Plan> of(BuildContext context) {
   return context.
    dependOnInheritedWidgetOfExactType<PlanProvider>()!.notifier!;
  }
}
```
**Code Penjelasan**
![img_1.png](img/13.png)

## Langkah 2: Perbarui file main.dart
Pada file main.dart, impor plan_provider.dart dan perbarui kode seperti berikut ini.
```dart
import 'package:flutter/material.dart';
import './views/plan_screen.dart';
import './provider/plan_provider.dart';
import './models/data_layer.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PlanProvider(
        notifier: ValueNotifier<Plan>(const Plan()),
        child: const PlanScreen(),
      ),
    );
  }
}
```
**Code Penjelasan**
![img_1.png](img/14.png)

## Langkah 3: Tambah method pada model plan.dart
Tambahkan dua method di dalam model class Plan sepe rti kode berikut.

```dart
int get completedCount => tasks
  .where((task) => task.complete)
  .length;

String get completenessMessage =>
  '$completedCount out of ${tasks.length} tasks';
```

**Code Penjelasan**
![img_1.png](img/15.png)

## Langkah 4: Pindah ke PlanScreen
Edit PlanScreen agar menggunakan data dari PlanProvider. Hapus deklarasi variabel plan (ini akan membuat error). Kita akan perbaiki pada langkah 5 berikut ini.

```dart
Plan plan = const Plan(); // <-- HAPUS BARIS INI
```

**Code Penjelasan**
![img_1.png](img/16.png)

## Langkah 5: Edit method _buildAddTaskButton
Tambahkan BuildContext sebagai parameter dan gunakan PlanProvider sebagai sumber datanya. Edit bagian kode seperti berikut.
```dart
Widget _buildAddTaskButton(BuildContext context) {
  ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
  return FloatingActionButton(
    child: const Icon(Icons.add),
    onPressed: () {
      Plan currentPlan = planNotifier.value;
      planNotifier.value = Plan(
        name: currentPlan.name,
        tasks: List<Task>.from(currentPlan.tasks)..add(const Task()),
      );
    },
  );
}
```

**Code Penjelasan**
![img_1.png](img/17.png)

## Langkah 6: Edit method _buildList
Tambahkan parameter BuildContext, gunakan PlanProvider sebagai sumber data. 
Ganti TextField menjadi TextFormField untuk membuat inisial data provider menjadi lebih mudah.

```dart
Widget _buildTaskTile(Task task, int index, BuildContext context) {
  ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
  return ListTile(
    leading: Checkbox(
       value: task.complete,
       onChanged: (selected) {
         Plan currentPlan = planNotifier.value;
         planNotifier.value = Plan(
           name: currentPlan.name,
           tasks: List<Task>.from(currentPlan.tasks)
             ..[index] = Task(
               description: task.description,
               complete: selected ?? false,
             ),
         );
       }),
    title: TextFormField(
      initialValue: task.description,
      onChanged: (text) {
        Plan currentPlan = planNotifier.value;
        planNotifier.value = Plan(
          name: currentPlan.name,
          tasks: List<Task>.from(currentPlan.tasks)
            ..[index] = Task(
              description: text,
              complete: task.complete,
            ),
        );
      },
    ),
  );
}
```

**Code Penjelasan**
![img_1.png](img/18.png)

## Langkah 7: Edit method _buildList
Sesuaikan parameter pada bagian _buildTaskTile seperti kode berikut.

```dart
Widget _buildList(Plan plan) {
   return ListView.builder(
     controller: scrollController,
     itemCount: plan.tasks.length,
     itemBuilder: (context, index) =>
        _buildTaskTile(plan.tasks[index], index, context),
   );
}
```

**Code Penjelasan**
![img_1.png](img/19.png)

## Langkah 8: Tetap di class PlanScreen
Edit method build sehingga bisa tampil progress pada bagian bawah (footer). 
Caranya, bungkus (wrap) _buildList dengan widget Expanded dan masukkan ke dalam widget Column seperti kode pada Langkah 9.

## Langkah 9: Tambah widget SafeArea
Terakhir, tambahkan widget SafeArea dengan berisi completenessMessage pada akhir widget Column. Perhatikan kode berikut ini.

```dart
@override
Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text('Master Plan')),
     body: ValueListenableBuilder<Plan>(
       valueListenable: PlanProvider.of(context),
       builder: (context, plan, child) {
         return Column(
           children: [
             Expanded(child: _buildList(plan)),
             SafeArea(child: Text(plan.completenessMessage))
           ],
         );
       },
     ),
     floatingActionButton: _buildAddTaskButton(context),
   );
}
```

**Code Penjelasan**
![img_1.png](img/20.png)

## HASIL
![img_1.png](img/hasil2.png)

## 6. Tugas Praktikum 2: InheritedWidget
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! 
Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.
2. Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?
3. Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?
4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
5. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !

Jawab:
### 2. InheritedWidget vs InheritedNotifier
Mana yang dimaksud InheritedWidget?
Pada Langkah 1, yang dimaksud InheritedWidget adalah class PlanProvider itu sendiri.

Lebih tepatnya, PlanProvider adalah custom class yang kita buat, yang mewarisi (extends) InheritedNotifier. InheritedNotifier sendiri adalah sub-class atau varian khusus dari InheritedWidget.

Jadi, PlanProvider adalah InheritedWidget yang memiliki kemampuan tambahan dari InheritedNotifier.

Mengapa digunakan InheritedNotifier?
Kita menggunakan InheritedNotifier (bukan InheritedWidget biasa) karena kita ingin UI secara otomatis diperbarui ketika datanya berubah.

InheritedWidget biasa pandai meneruskan data ke bawah (ke widget tree), tapi ia tidak tahu kapan data itu berubah kecuali kita memberitahunya secara manual.
InheritedNotifier dirancang khusus untuk "mendengarkan" sebuah Listenable (dalam praktikum ini adalah ValueNotifier<Plan>).
Alurnya begini:

PlanProvider (sebuah InheritedNotifier) menyimpan ValueNotifier<Plan>.
Ketika kita mengubah data (misal, menambah tugas), kita sebenarnya mengubah .value dari ValueNotifier tersebut (Langkah 5 & 6).
ValueNotifier "berteriak" (memberi notifikasi) bahwa nilainya telah berubah.
PlanProvider (yang mendengarkan "teriakan" itu) secara otomatis memberi tahu semua widget di bawahnya yang "tergantung" padanya (yang memanggil PlanProvider.of(context)) untuk membangun ulang (rebuild) dirinya.
Inilah mengapa di Langkah 9, ValueListenableBuilder bisa secara ajaib memperbarui tampilan teks progres saat Anda mencentang checkbox.

### 3. Maksud Method di Langkah 3
Langkah 3 menambahkan dua getter (properti turunan) ke dalam class Plan:
```dart
int get completedCount => ...;
String get completenessMessage => ...;
```
Maksudnya adalah:

completedCount: Ini adalah getter yang menghitung jumlah tugas yang sudah selesai. Ia memeriksa seluruh List<Task> dan menghitung berapa banyak Task yang propertinya complete == true.
completenessMessage: Ini adalah getter yang membuat pesan status (teks) yang rapi untuk ditampilkan di UI. Ia mengambil hasil dari completedCount dan jumlah total tugas (tasks.length) untuk membuat string seperti: "2 out of 5 tasks".
Mengapa dilakukan demikian?

Ini adalah inti dari arsitektur Model-View (Pemisahan Logika).

Model (class Plan) bertanggung jawab atas data dan logika bisnis (dalam hal ini, cara menghitung progres).
View (PlanScreen) bertanggung jawab hanya untuk menampilkan data.
Daripada menulis logika penghitungan ini di dalam PlanScreen, kita menempatkannya di dalam class Plan itu sendiri. Dengan cara ini, kode di PlanScreen (View) menjadi sangat bersih. 
Ia tidak perlu tahu cara menghitung progres; ia hanya perlu "meminta" hasilnya dengan memanggil plan.completenessMessage.

### 4. Hasil Langkah 9 (Simulasi GIF dan Penjelasan)

Penjelasan Apa yang Telah Dibuat (Langkah 9)
Langkah 9 adalah langkah final yang mengikat semuanya. Kita mengganti body dari Scaffold dengan widget ValueListenableBuilder.

Apa itu ValueListenableBuilder? Ini adalah widget khusus yang tugasnya "mendengarkan" ValueNotifier (yang kita simpan di PlanProvider).

Fungsi builder: di dalamnya akan secara otomatis dijalankan ulang setiap kali nilai di dalam PlanProvider berubah.

Apa hasilnya? Kita membuat UI yang reaktif. Di dalam builder, kita membuat Column yang berisi:

Expanded(_buildList(plan)): Daftar tugas kita.
SafeArea(Text(plan.completenessMessage)): Teks progres dari Langkah 3.
Setiap kali mencentang checkbox (yang mengubah data di PlanProvider), ValueListenableBuilder mendeteksinya dan langsung membangun ulang Text di bagian bawah dengan pesan progres yang baru.


Praktikum 3: Membuat State di Multiple Screens
Satu kalimat populer atau viral yang beredar dalam komunitas Flutter adalah "Lift State Up". Mantra ini merujuk ke sebuah ide di mana objek State seharusnya berada lebih tinggi dari pada widget yang membutuhkannya di dalam sebuah widget tree. InheritedWidget yang telah kita buat sebelumnya bekerja dengan sempurna pada satu screen, tapi apa yang akan terjadi jika kita tambah screen kedua ?

Pada codelab ini, Anda akan menambah screen lain pada aplikasi Master Plan sehingga bisa membuat kelompok daftar plan lebih dari satu.

Selesaikan langkah-langkah praktikum berikut ini menggunakan editor Visual Studio Code (VS Code) atau Android Studio atau code editor lain kesukaan Anda.

Perhatian: Diasumsikan Anda telah berhasil menyelesaikan praktikum 2.

## Langkah 1: Edit PlanProvider
Perhatikan kode berikut, edit class PlanProvider sehingga dapat menangani List Plan.
```dart
import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<List<Plan>>> {
  const PlanProvider({
    super.key,
    required Widget child,
    required ValueNotifier<List<Plan>> notifier, 
  }) : super(child: child, notifier: notifier);

  static ValueNotifier<List<Plan>> of(BuildContext context) { 
    return context
        .dependOnInheritedWidgetOfExactType<PlanProvider>()!
        .notifier!;
  }
}
```

**Code Penjelasan**
![img_1.png](21.png)

## Langkah 2: Edit main.dart
Langkah sebelumnya dapat menyebabkan error pada main.dart dan plan_screen.dart. 
Pada method build, gantilah menjadi kode seperti ini.

```dart
import 'package:flutter/material.dart';
import './provider/plan_provider.dart';
import './models/data_layer.dart';
import './views/plan_creator_screen.dart'; 

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {

    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []),
      child: MaterialApp(
        title: 'State management app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PlanCreatorScreen(), 
      ),
    );
  }
}
```

**Code Penjelasan**
![img_1.png](22.png)

## Langkah 3: Edit plan_screen.dart
Tambahkan variabel plan dan atribut pada constructor-nya seperti berikut.

```dart
final Plan plan;
const PlanScreen({super.key, required this.plan});
```
**Code Penjelasan**
![img_1.png](23.png)

## Langkah 4: Error
Itu akan terjadi error setiap kali memanggil PlanProvider.of(context). 
Itu terjadi karena screen saat ini hanya menerima tugas-tugas untuk satu kelompok Plan, 
tapi sekarang PlanProvider menjadi list dari objek plan tersebut.

## Langkah 5: Tambah getter Plan

Tambahkan getter pada _PlanScreenState seperti kode berikut.
```dart
Plan get plan => widget.plan;
```

**Code Penjelasan**
![img_1.png](24.png)

## Langkah 6: Method initState()
Pada bagian ini kode tetap seperti berikut.

```dart
@override
void initState() {
   super.initState();
   scrollController = ScrollController()
    ..addListener(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
}
```

## Langkah 7: Widget build
Pastikan Anda telah merubah ke List dan mengubah nilai pada currentPlan seperti kode berikut ini.

```dart
 @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          Plan currentPlan = plans.firstWhere((p) => p.name == plan.name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(
        context,
      ),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = plan; 
        int planIndex =
            planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
        
        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task());
        
        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(
            name: currentPlan.name,
            tasks: updatedTasks,
          );
      },
    );
  }
```

**Code Penjelasan**
![img_1.png](25.png)

## Langkah 8: Edit _buildTaskTile
Pastikan ubah ke List dan variabel planNotifier seperti kode berikut ini.

```dart
Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            Plan currentPlan = plan; 
            int planIndex = planNotifier.value
                .indexWhere((p) => p.name == currentPlan.name);
            
            planNotifier.value = List<Plan>.from(planNotifier.value)
              ..[planIndex] = Plan(
                name: currentPlan.name,
                tasks: List<Task>.from(currentPlan.tasks)
                  ..[index] = Task(
                    description: task.description,
                    complete: selected ?? false,
                  ),
              );
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = plan; 
          int planIndex =
              planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
          
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
        },
      ),
    );
  }
```

**Code Penjelasan**
![img_1.png](26.png)


## Langkah 9: Buat screen baru
Pada folder view, buatlah file baru dengan nama plan_creator_screen.dart dan deklarasikan dengan StatefulWidget bernama PlanCreatorScreen. 
Gantilah di main.dart pada atribut home menjadi seperti berikut.

```dart
import 'package.flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';
import './plan_screen.dart'; 

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  State<PlanCreatorScreen> createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
```

**Code Penjelasan**
![img_1.png](27.png)


## Langkah 10: Isi _PlanCreatorScreenState
```dart
import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';
import './plan_screen.dart'; 

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  State<PlanCreatorScreen> createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  // Langkah 11: Method build utama
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plans Rifda')),
      body: Column(children: [
        _buildListCreator(),
        Expanded(child: _buildMasterPlans())
      ]),
    );
  }

  // Langkah 12: Widget untuk TextField
  Widget _buildListCreator() {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Material(
          color: Theme.of(context).cardColor,
          elevation: 10,
          child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                  labelText: 'Add a plan',
                  contentPadding: EdgeInsets.all(20)),
              onEditingComplete: addPlan),
        ));
  }

  // Langkah 13: Logika untuk menambah Rencana baru
  void addPlan() {
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }
    final plan = Plan(name: text, tasks: []);
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    
    planNotifier.value = List<Plan>.from(planNotifier.value)..add(plan);
    
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // Langkah 14: Widget untuk menampilkan daftar Rencana (VERSI DIPERBAIKI)
  Widget _buildMasterPlans() {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ValueListenableBuilder<List<Plan>>(
      valueListenable: planNotifier,
      builder: (context, plans, child) {
        
        if (plans.isEmpty) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.note, size: 100, color: Colors.grey),
                Text('Anda belum memiliki rencana apapun.',
                    style: Theme.of(context).textTheme.headlineSmall)
              ]);
        }

        return ListView.builder(
            itemCount: plans.length,
            itemBuilder: (context, index) {
              final plan = plans[index];
              return ListTile(
                  title: Text(plan.name),
                  subtitle: Text(plan.completenessMessage),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => PlanScreen(plan: plan)));
                  });
            });
      },
    );
  }
}
```

**Code Penjelasan**
![img_1.png](28.png)

## HASIL
![img_1.png](HASIL3.png)


## Tugas Praktikum 3
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, 
silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.
2. Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!

![img_1.png](DIAGRAM .png)

3. Lakukan capture hasil dari Langkah 14 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
4. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !

### Jawab:
#### 2. Penjelasan Diagram Widget Tree
   Gambar tersebut dengan sempurna merangkum arsitektur state management "Lift State Up" yang Anda bangun di Praktikum 3.

Diagram ini menunjukkan dua kondisi widget tree yang berbeda:

1. Sisi Kiri (Biru): PlanCreatorScreen
   Ini adalah widget tree untuk halaman utama Anda (PlanCreatorScreen).

Poin Penting: Perhatikan bahwa PlanProvider berada di atas PlanCreatorScreen. (Dalam kode Anda, PlanProvider bahkan berada di atas MaterialApp). Ini adalah kunci dari "Lift State Up".
Struktur: Halaman ini terdiri dari Column yang berisi TextField (untuk menambah rencana baru) dan Expanded berisi ListView (untuk menampilkan daftar semua rencana Anda).
2. Sisi Kanan (Hijau): PlanScreen
   Ini adalah widget tree untuk halaman detail Anda (PlanScreen) setelah Anda melakukan navigasi.

Struktur: Halaman ini berisi Column yang memiliki Expanded berisi ListView (untuk menampilkan daftar tugas dari satu rencana) dan SafeArea berisi Text (untuk menampilkan progres tugas).
3. Panah Navigator Push
   Panah ini adalah aksi yang menghubungkan kedua layar.

Maksudnya: Ketika pengguna mengetuk sebuah item di dalam ListView di sisi kiri (halaman PlanCreatorScreen), aplikasi menjalankan Navigator.push.
Aksi ini "mendorong" layar PlanScreen (sisi kanan) ke atas tumpukan navigasi, sambil mengirimkan data Plan spesifik yang diketuk tersebut.
Kesimpulan: Diagram ini menunjukkan bahwa PlanProvider hidup di level yang lebih tinggi daripada kedua layar. Karena PlanProvider ada di atas, PlanCreatorScreen (kiri) dapat menambah rencana baru ke dalamnya, dan PlanScreen (kanan) dapat membaca dan memperbarui rencana yang sama. Keduanya berbagi satu sumber data (state) yang sama.


#### 3. Penjelasan Langkah 14
Langkah 14 adalah implementasi dari method _buildMasterPlans() di dalam PlanCreatorScreen. Ini adalah "jantung" dari halaman utama.

Apa yang dibuat: Anda membuat sebuah widget yang tugasnya membangun daftar semua rencana Anda (bagian ListView di sisi kiri diagram).

Berikut adalah rincian tugasnya:

Mendengarkan State: Widget ini "mendengarkan" data dari PlanProvider (idealnya menggunakan ValueListenableBuilder seperti yang saya pandu) untuk mendapatkan List<Plan> terbaru.

Menangani Kondisi Kosong: Ia mengecek jika daftar (plans) tersebut kosong. Jika ya, ia menampilkan pesan "Anda belum memiliki rencana apapun."

Membangun Daftar: Jika daftar tidak kosong, ia membuat ListView.builder.

Membuat ListTile: Untuk setiap plan di dalam daftar, ia membuat sebuah ListTile (satu baris di daftar) yang menampilkan:

title: Nama rencana (plan.name).
subtitle: Progres rencana (plan.completenessMessage).
Menangani Navigasi (onTap): Ini adalah bagian terpenting. Anda menambahkan fungsi onTap pada ListTile. Fungsi inilah yang menjalankan Navigator.push (panah di diagram) untuk mengirim pengguna ke PlanScreen sambil membawa data plan yang baru saja mereka ketuk.


