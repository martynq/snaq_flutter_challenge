import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:snaq/features/meals/presentation/screen/meal_detail_screen.dart';
import 'package:snaq/features/meals/presentation/widgets/see_more_info_container.dart';
import 'package:snaq/models/meal.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    Key? key,
    required this.meal,
    this.smallCard = false,
  }) : super(key: key);

  final Meal meal;
  final bool smallCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: smallCard ? 20 : 5,
      ),
      child: OpenContainer(
        middleColor: Colors.white,
        openColor: Colors.white,
        closedElevation: 0,
        openBuilder: (BuildContext _, VoidCallback closeContainer) {
          return MealDetailScreen(
            meal: meal,
          );
        },
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(meal.id ?? ''),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: smallCard ? 5 : 0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: smallCard
                        ? Image.file(
                            File(
                              meal.image ?? '',
                            ),
                            width: 50,
                            height: 50,
                          )
                        : Stack(
                            children: [
                              Image.file(
                                File(
                                  meal.image ?? '',
                                ),
                              ),
                              const SeeMoreInfoContainer(),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 850),
      ),
    );
  }
}
