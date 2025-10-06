<div align="center">

## TUGAS PRAKTIKUM

</div>

---

CODE:

**MAIN.dart**

```dart
import 'package:flutter/material.dart';
import 'red_text_widget.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Flutter Plugin Pub.dev',
theme: ThemeData(
colorSchemeSeed: Colors.indigo,
useMaterial3: true,
),
home: const MyHomePage(title: 'AutoSizeText Demo'),
);
}
}

class MyHomePage extends StatefulWidget {
const MyHomePage({super.key, required this.title});
final String title;

@override
State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
int _counter = 0;
void _incrementCounter() => setState(() => _counter++);

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text(widget.title)),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
// ====== Tambahan sesuai instruksi ======
Container(
color: Colors.yellowAccent,
width: 50, // sangat sempit → AutoSizeText akan mengecilkan font
child: const RedTextWidget(
text: 'You have pushed the button this many times:',
),
),
const SizedBox(height: 12),
Container(
color: Colors.greenAccent,
width: 100,
child: const Text(
'You have pushed the button this many times:',
),
),
const SizedBox(height: 24),
// ====== Sisa konten default counter ======
Text(
'$_counter',
style: Theme.of(context).textTheme.headlineMedium,
),
],
),
),
floatingActionButton: FloatingActionButton(
onPressed: _incrementCounter,
tooltip: 'Increment',
child: const Icon(Icons.add),
),
);
}
}
```

**red_text_widget.dart**

```dart
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart'; // ← WAJIB: import plugin

class RedTextWidget extends StatelessWidget {
final String text; // ← variabel yang akan ditampilkan

const RedTextWidget({Key? key, required this.text}) : super(key: key);

@override
Widget build(BuildContext context) {
return AutoSizeText(
text,
style: const TextStyle(color: Colors.red, fontSize: 14),
maxLines: 2,
overflow: TextOverflow.ellipsis,
);
}
}
```

**output dari code**

---

<div align="center">

## TUGAS PRAKTIKUM

</div>

---

CODE:

**MAIN.dart**

```dart
import 'package:flutter/material.dart';
import 'red_text_widget.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Flutter Plugin Pub.dev',
theme: ThemeData(
colorSchemeSeed: Colors.indigo,
useMaterial3: true,
),
home: const MyHomePage(title: 'AutoSizeText Demo'),
);
}
}

class MyHomePage extends StatefulWidget {
const MyHomePage({super.key, required this.title});
final String title;

@override
State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
int _counter = 0;
void _incrementCounter() => setState(() => _counter++);

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text(widget.title)),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
// ====== Tambahan sesuai instruksi ======
Container(
color: Colors.yellowAccent,
width: 50, // sangat sempit → AutoSizeText akan mengecilkan font
child: const RedTextWidget(
text: 'You have pushed the button this many times:',
),
),
const SizedBox(height: 12),
Container(
color: Colors.greenAccent,
width: 100,
child: const Text(
'You have pushed the button this many times:',
),
),
const SizedBox(height: 24),
// ====== Sisa konten default counter ======
Text(
'$_counter',
style: Theme.of(context).textTheme.headlineMedium,
),
],
),
),
floatingActionButton: FloatingActionButton(
onPressed: _incrementCounter,
tooltip: 'Increment',
child: const Icon(Icons.add),
),
);
}
}
```

**red_text_widget.dart**

```dart
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart'; // ← WAJIB: import plugin

class RedTextWidget extends StatelessWidget {
final String text; // ← variabel yang akan ditampilkan

const RedTextWidget({Key? key, required this.text}) : super(key: key);

@override
Widget build(BuildContext context) {
return AutoSizeText(
text,
style: const TextStyle(color: Colors.red, fontSize: 14),
maxLines: 2,
overflow: TextOverflow.ellipsis,
);
}
}
```

**output dari code**

![img.png](img/img1.png)
