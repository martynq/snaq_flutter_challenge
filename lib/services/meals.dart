import "package:dio/dio.dart";
import 'package:snaq/app/common/configurations.dart';
import 'package:snaq/models/meals_list.dart';

class FoodService {
  final Dio dio = Dio(BaseOptions(baseUrl: basicUrl));
  final String _basePath = "meals/";

  Future<MealsList> getFood() async {
    Response response = await dio.get(
      _basePath,
    );

    return MealsList.fromJson(response.data);
  }
}
