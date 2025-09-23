import 'dart:async';
import 'package:flutter/material.dart';

class DateTimePickerDemo extends StatefulWidget {
  const DateTimePickerDemo({super.key, required this.title});
  final String title;

  @override
  State<DateTimePickerDemo> createState() => _DateTimePickerDemoState();
}

class _DateTimePickerDemoState extends State<DateTimePickerDemo> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() => selectedDate = picked);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate),
    );
    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  String get _dateText =>
      "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";

  String get _timeText => selectedTime == null
      ? "--:--"
      : "${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Tanggal: $_dateText"),
            Text("Waktu:   $_timeText"),
            const SizedBox(height: 20),
            ElevatedButton(
              // JANGAN pakai `() => { ... }` (itu set literal).
              onPressed: () {
                _selectDate(context);
                // contoh log:
                // ignore: avoid_print
                print("Picked date: $_dateText");
              },
              child: const Text('Pilih Tanggal'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _selectTime(context);
                // ignore: avoid_print
                print("Picked time: $_timeText");
              },
              child: const Text('Pilih Waktu'),
            ),
          ],
        ),
      ),
    );
  }
}
