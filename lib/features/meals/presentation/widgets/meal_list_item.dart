import 'package:flutter/material.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.ingredientsName,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback onTap;
  final String ingredientsName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 1),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.white,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ingredientsName,
              ),
              const SizedBox(
                width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
