import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snaq/app/resources/strings/snaq_strings.dart';
import 'package:snaq/features/meals/data/cubit/meals_cubit.dart';
import 'package:snaq/features/meals/data/filtered_list_helper.dart';
import 'package:snaq/features/meals/presentation/widgets/meal_list_item.dart';
import 'package:snaq/models/meal.dart';

class UserPreferencesScreen extends StatefulWidget {
  const UserPreferencesScreen({
    Key? key,
    required this.meal,
  }) : super(key: key);
  final List<Meal> meal;

  @override
  State<UserPreferencesScreen> createState() => _UserPreferencesScreenState();
}

class _UserPreferencesScreenState extends State<UserPreferencesScreen> {
  final controller = ScrollController();
  List<String> eliminatedIngredients = [];

  @override
  Widget build(BuildContext context) {
    final list =
        FilteredListHelper.getListOfEliminatedIngredients(widget.meal) ?? [];
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(SnaqStrings.preferencesInfo),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return MealListItem(
                onTap: () {
                  setState(() {
                    if (eliminatedIngredients.contains(list[index])) {
                      eliminatedIngredients.remove(list[index]);
                    } else {
                      eliminatedIngredients.add(list[index]);
                    }
                  });
                },
                isSelected: eliminatedIngredients.contains(list[index]),
                ingredientsName: list[index],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () async {
                  BlocProvider.of<MealsCubit>(context)
                      .loadedState(eliminatedIngredients);
                },
                child: const Text(SnaqStrings.done)),
          ),
        ],
      ),
    );
  }
}
