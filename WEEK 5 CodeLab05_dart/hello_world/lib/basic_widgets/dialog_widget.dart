import 'package:flutter/material.dart';

class DialogDemo extends StatelessWidget {
  const DialogDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Show alert'),
        onPressed: () => showAlertDialog(context),
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  final okButton = TextButton(
    child: const Text("OK"),
    onPressed: () => Navigator.pop(context),
  );

  final alert = AlertDialog(
    title: const Text("My title"),
    content: const Text("This is my message."),
    actions: [okButton],
  );

  showDialog(
    context: context,
    builder: (context) => alert,
  );
}
