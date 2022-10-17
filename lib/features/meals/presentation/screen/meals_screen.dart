import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snaq/features/meals/data/cubit/meals_cubit.dart';
import 'package:snaq/features/meals/data/cubit/meals_state.dart';
import 'package:snaq/features/meals/presentation/screen/user_preferences_screen.dart';
import 'package:snaq/features/meals/presentation/widgets/meals_cards_view.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future(() => false),
        child: BlocProvider<MealsCubit>(
          create: (context) => MealsCubit(),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: BlocConsumer<MealsCubit, MealsState>(
              listener: (context, state) async {},
              builder: (context, state) {
                if (state is MealsInitial || state is MealsFailure) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is MealsFiltered) {
                  return MealsCardsView(
                    state: state,
                  );
                }
                if (state is MealsLoaded) {
                  return UserPreferencesScreen(meal: state.meals!);
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ));
  }
}
