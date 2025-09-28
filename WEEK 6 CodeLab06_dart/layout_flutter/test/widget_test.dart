// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:layout_flutter/main.dart';

void main() {
  // Simulasi list default
  TestWidgetsFlutterBinding.ensureInitialized();

  // Tes apakah asset bisa di-load
  test('All word images exist in assets', () async {
    bool exists = true;
    try {
      await rootBundle.load('assets/images/lake.png');
    } catch (e) {
      exists = false;
    }
    print('${'assets/images/lake.png'} -> exists? $exists'); // <-- print status
    expect(exists, true, reason: 'Asset not found: ${'assets/images/lake.png'}');
  }
  );

}
