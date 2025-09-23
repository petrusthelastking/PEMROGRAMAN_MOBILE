import 'package:flutter/material.dart';

class FabWidget extends StatelessWidget {
  const FabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Thumbs up!')),
          );
        },
        child: SizedBox(
            width: 50,
            height: 50,
            child: const Icon(Icons.thumb_up)),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
