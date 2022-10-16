import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snaq/app/resources/strings/snaq_strings.dart';
import 'package:snaq/features/meals/presentation/widgets/nutrition_detail.dart';
import 'package:snaq/models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    Key? key,
    required this.meal,
  }) : super(key: key);
  final Meals meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 10.0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    meal.id ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Image.file(
                  File(
                    meal.image ?? '',
                  ),
                  height: 200,
                  width: 200,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    SnaqStrings.nutritionDeclarationMeal,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                NutritionDetail(nutrition: meal.nutrition),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    SnaqStrings.ingredientsNutrition,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Column(
                  children: [
                    ...meal.mealComponents!.map(
                      (e) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (e.mainIngredient?.name != null)
                            Text(e.mainIngredient?.name ?? ''),
                          if (e.mainIngredient?.nutrition != null)
                            NutritionDetail(
                                nutrition: e.mainIngredient?.nutrition)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
