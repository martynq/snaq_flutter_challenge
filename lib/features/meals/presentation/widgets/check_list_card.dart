import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:snaq/app/resources/strings/snaq_strings.dart';
import 'package:snaq/features/meals/presentation/screen/liked_disliked_meals_screen.dart';
import 'package:snaq/models/meals.dart';

class CheckListCard extends StatelessWidget {
  const CheckListCard({
    Key? key,
    this.favouriteMeals,
    this.dislikeMeals,
  }) : super(key: key);

  final List<Meals>? favouriteMeals;
  final List<Meals>? dislikeMeals;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OpenContainer(
          middleColor: Colors.white,
          openColor: Colors.white,
          closedElevation: 0,
          openBuilder: (BuildContext _, VoidCallback closeContainer) {
            return LikedDislikedMealsScreen(
              meals: favouriteMeals,
              appBarTitle: SnaqStrings.favouriteMeals,
            );
          },
          closedBuilder: (BuildContext _, VoidCallback openContainer) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Row(
                children: const [
                  Text(SnaqStrings.checkFavouriteMeals),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.thumb_up_outlined,
                    color: Colors.green,
                  ),
                ],
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 850),
        ),
        OpenContainer(
          middleColor: Colors.white,
          openColor: Colors.white,
          closedElevation: 0,
          openBuilder: (BuildContext _, VoidCallback closeContainer) {
            return LikedDislikedMealsScreen(
              meals: dislikeMeals,
              appBarTitle: SnaqStrings.dislikeMeals,
            );
          },
          closedBuilder: (BuildContext _, VoidCallback openContainer) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Row(
                children: const [
                  Text(SnaqStrings.checkDislikeMeals),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.thumb_down_outlined,
                    color: Colors.red,
                  ),
                ],
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 850),
        ),
      ],
    );
  }
}
