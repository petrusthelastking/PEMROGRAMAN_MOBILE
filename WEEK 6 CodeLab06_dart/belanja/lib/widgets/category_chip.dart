import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isActive;

  const CategoryChip({
    super.key,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.teal[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: isActive ? Colors.teal : Colors.teal[50],
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isActive ? Colors.teal : Colors.teal.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}