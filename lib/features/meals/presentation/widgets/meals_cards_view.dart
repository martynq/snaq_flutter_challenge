import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snaq/app/resources/strings/snaq_strings.dart';
import 'package:snaq/features/meals/data/cubit/meals_cubit.dart';
import 'package:snaq/features/meals/data/cubit/meals_state.dart';
import 'package:snaq/features/meals/presentation/widgets/filtered_list.dart';
import 'package:snaq/features/meals/presentation/widgets/meal_card.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class MealsCardsView extends StatefulWidget {
  const MealsCardsView({
    Key? key,
    required this.state,
  }) : super(key: key);

  final MealsFiltered state;

  @override
  State<MealsCardsView> createState() => _MealsCardsViewState();
}

class _MealsCardsViewState extends State<MealsCardsView> {
  final SwipeableCardSectionController _cardController =
      SwipeableCardSectionController();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              SnaqStrings.swipeInfo,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          SwipeableCardsSection(
            cardController: _cardController,
            context: context,
            items: [
              ...widget.state.meals!
                  .map(
                    (e) => MealCard(
                      meal: e,
                    ),
                  )
                  .toList(),
            ],
            onCardSwiped: (dir, index, widgets) {
              bool pushToSummaryScreen =
                  index == widget.state.meals!.length - 1;
              if (widget.state.meals!.length > 3) {
                if (index < widget.state.meals!.length - 3) {
                  _cardController.addItem(MealCard(
                    meal: widget.state.meals![index + 3],
                  ));
                }
                if (pushToSummaryScreen) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FilteredList(
                        favouriteMeals: widget.state.favouriteMeals,
                        dislikeMeals: widget.state.dislikeMeals,
                      ),
                    ),
                  );
                }
              }
              if (widget.state.meals!.length <= 3 && pushToSummaryScreen) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilteredList(
                      favouriteMeals: widget.state.favouriteMeals,
                      dislikeMeals: widget.state.dislikeMeals,
                    ),
                  ),
                );
              }

              if (dir == Direction.left) {
                BlocProvider.of<MealsCubit>(context)
                    .addToDislikeList(widget.state.meals![index]);
              } else if (dir == Direction.right) {
                BlocProvider.of<MealsCubit>(context)
                    .addToFavouriteList(widget.state.meals![index]);
              }
            },
            enableSwipeUp: false,
            enableSwipeDown: false,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    icon: const Icon(Icons.thumb_down_outlined),
                    color: Colors.red,
                    onPressed: () {
                      _cardController.triggerSwipeLeft();
                    }),
                IconButton(
                    icon: const Icon(Icons.thumb_up_outlined),
                    color: Colors.green,
                    onPressed: () {
                      _cardController.triggerSwipeRight();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
