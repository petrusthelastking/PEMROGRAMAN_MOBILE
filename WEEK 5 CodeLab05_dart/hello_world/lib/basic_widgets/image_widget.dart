import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: const Image(
          image: AssetImage("assets/Logo-Polinema.jpg")
      ),
    );
  }
}