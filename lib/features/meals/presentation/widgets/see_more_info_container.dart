import 'package:flutter/material.dart';
import 'package:snaq/app/resources/strings/snaq_strings.dart';

class SeeMoreInfoContainer extends StatelessWidget {
  const SeeMoreInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 60,
          height: 60,
          color: Colors.white,
          child: const Center(
            child: Text(
              SnaqStrings.tapToSeeMore,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.red, fontSize: 10, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
