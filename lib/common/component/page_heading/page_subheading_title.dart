import 'package:flutter/material.dart';
import 'package:socialmedia/common/responsive/screenUtils.dart';

class PageSubheadingTitle extends StatelessWidget {
  final String subtitle;
  const PageSubheadingTitle({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black54,
          fontFamily: 'Poppins Medium',
          fontSize: ScreenUtils.width(context) * 0.034),
    );
  }
}
