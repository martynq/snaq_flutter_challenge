import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snaq/features/meals/data/cubit/meals_cubit.dart';
import 'package:snaq/features/meals/data/cubit/meals_state.dart';
import 'package:snaq/features/meals/presentation/screen/filtered_list.dart';
import 'package:snaq/features/meals/presentation/widgets/meal_card.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class MealsCardsView extends StatefulWidget {
  const MealsCardsView({
    Key? key,
    required this.state,
  }) : super(key: key);

  final MealsLoaded state;

  @override
  State<MealsCardsView> createState() => _MealsCardsViewState();
}

class _MealsCardsViewState extends State<MealsCardsView> {
  final SwipeableCardSectionController _cardController =
      SwipeableCardSectionController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            if (index <=
                widget.state.meals!.length - (widget.state.meals!.length - 3)) {
              _cardController.addItem(MealCard(
                meal: widget.state.meals![index + 3],
              ));
            }
            if (index == 6) {
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
              _IconButton(
                  icon: Icons.thumb_down_outlined,
                  color: Colors.red,
                  onTap: () {
                    _cardController.triggerSwipeLeft();
                  }),
              _IconButton(
                icon: Icons.thumb_up_outlined,
                color: Colors.green,
                onTap: () {
                  _cardController.triggerSwipeRight();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        icon,
        color: color,
      ),
      onTap: () => onTap.call(),
    );
  }
}
