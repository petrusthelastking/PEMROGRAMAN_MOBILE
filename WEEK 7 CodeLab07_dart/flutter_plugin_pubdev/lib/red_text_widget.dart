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
