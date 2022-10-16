import 'package:flutter/material.dart';
import 'package:snaq/features/meals/presentation/widgets/check_list_card.dart';
import 'package:snaq/models/meal.dart';

class FilteredList extends StatelessWidget {
  const FilteredList({
    Key? key,
    this.favouriteMeals,
    this.dislikeMeals,
  }) : super(key: key);

  final List<Meal>? favouriteMeals;
  final List<Meal>? dislikeMeals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CheckListCard(
                  favouriteMeals: favouriteMeals,
                  dislikeMeals: dislikeMeals,
                ),
              ],
            ),
          ),
        ));
  }
}
