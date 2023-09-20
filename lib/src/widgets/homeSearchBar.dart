import 'package:brodone/src/constants/color-constants.dart';
import 'package:flutter/material.dart';

class NeumorphicSearchBar extends StatelessWidget {
  final Function(String) onTextChanged;
  final Function() onFilterPressed;

  NeumorphicSearchBar({
    required this.onTextChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.backgroundColor, // Background color
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action here
            },
          ),
          Expanded(
            child: TextField(
              onChanged: onTextChanged,
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: onFilterPressed,
          ),
        ],
      ),
    );
  }
}
