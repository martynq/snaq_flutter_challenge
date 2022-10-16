import 'package:flutter/material.dart';
import 'package:snaq/app/resources/strings/snaq_strings.dart';
import 'package:snaq/features/meals/presentation/widgets/meal_card.dart';
import 'package:snaq/models/meals.dart';

class LikedDislikedMealsScreen extends StatelessWidget {
  const LikedDislikedMealsScreen({
    Key? key,
    this.meals,
    this.appBarTitle,
  }) : super(key: key);

  final List<Meals>? meals;
  final String? appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle ?? '',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
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
      body: meals!.isEmpty
          ? const Center(
              child: Text(
                SnaqStrings.noItemOnList,
              ),
            )
          : ListView(
              children: [
                ...meals!.map(
                  (e) => MealCard(
                    meal: e,
                    smallCard: true,
                  ),
                ),
              ],
            ),
    );
  }
}
