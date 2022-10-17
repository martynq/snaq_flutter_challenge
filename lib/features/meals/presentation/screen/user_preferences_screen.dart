import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snaq/features/meals/data/cubit/meals_cubit.dart';
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
  List<String> dontLikeList = [];

  @override
  Widget build(BuildContext context) {
    final list = getList(widget.meal) ?? [];

    print('dontLikeList');
    print(dontLikeList);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
                'Tell us if you dont like any of ingreidents listed below'),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (dontLikeList.contains(list[index])) {
                        dontLikeList.remove(list[index]);
                      } else {
                        dontLikeList.add(list[index]);
                      }
                    });
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 1),
                    decoration: BoxDecoration(
                      color: dontLikeList.contains(list[index])
                          ? Colors.purple
                          : Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            list[index],
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<MealsCubit>(context)
                      .loadedState(dontLikeList);
                },
                child: Text('Done')),
          ),
        ],
      ),

      //       ),
      //     ],
      //   ),
    );
  }

  List<String>? getList(List<Meal> meals) {
    var myCategory = meals.map((x) => x.mealComponents).toList();
    final list = List.of(myCategory)
        .map((e) => e!.map((e) => e.mainIngredient?.name ?? '').toList())
        .toList();
    var x = list.expand((x) => x).toSet().toList();
    x.removeWhere((item) => [""].contains(item));

    return x;
  }
}

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: meal.mealComponents?.length ?? 0,
        itemBuilder: (context, index) {
          return Text(
            meal.mealComponents?[index].mainIngredient?.name ?? '',
          );
        });
  }
}
