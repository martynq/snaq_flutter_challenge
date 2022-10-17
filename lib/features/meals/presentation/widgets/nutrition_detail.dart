import 'package:flutter/material.dart';
import 'package:snaq/features/meals/presentation/widgets/single_nutrition_detalil.dart';
import 'package:snaq/models/nutrition.dart';

class NutritionDetail extends StatelessWidget {
  const NutritionDetail({
    Key? key,
    this.nutrition,
  }) : super(key: key);

  final Nutrition? nutrition;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        children: [
          SingleNutritionDetail(
            nutrientsDetail: nutrition?.protein,
          ),
          SingleNutritionDetail(
            nutrientsDetail: nutrition?.fatTotal,
          ),
          SingleNutritionDetail(
            nutrientsDetail: nutrition?.carbohydrates,
          ),
          SingleNutritionDetail(
            nutrientsDetail: nutrition?.energy,
          ),
        ],
      ),
    );
  }
}
