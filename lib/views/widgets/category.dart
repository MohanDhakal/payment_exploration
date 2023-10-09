import 'package:flutter/material.dart';

class CategorySingle extends StatelessWidget {
  final String name;
  final Function() onPressed;
  const CategorySingle(
      {super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Divider(
            thickness: 1,
            color: Colors.grey.shade400,
          )
        ],
      ),
    );
  }
}
