import 'package:flutter/material.dart';

import '../../responsive/screenUtils.dart';

class BlackPageHeading extends StatelessWidget {
  final String title;
  const BlackPageHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins SemiBold',
          fontSize: ScreenUtils.width(context) * 0.06),
      textAlign: TextAlign.center,
    );
  }
}
