import 'package:flutter/material.dart';
import 'package:snaq/models/nutrients_detail.dart';

class SingleNutritionDetail extends StatelessWidget {
  const SingleNutritionDetail({
    Key? key,
    required this.nutrientsDetail,
  }) : super(key: key);

  final NutrientsDetail? nutrientsDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(nutrientsDetail?.name ?? ''),
        const Spacer(),
        Text((nutrientsDetail?.value ?? '').toString()),
        Text(nutrientsDetail?.abbreviation?.unit ?? ''),
      ],
    );
  }
}
