import 'package:flutter/material.dart';
import 'package:socialmedia/common/responsive/screenUtils.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CommonButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: ScreenUtils.width(context) * 0.01),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent.shade400,
            // Button color
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(ScreenUtils.width(context) * 0.1),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins Medium',
                fontSize: ScreenUtils.width(context) * 0.04),
          ),
        ),
      ),
    );
  }
}
