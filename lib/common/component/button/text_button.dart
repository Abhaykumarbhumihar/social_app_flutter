import 'package:flutter/material.dart';

class TextButtonComponent extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const TextButtonComponent({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style:
            const TextStyle(fontFamily: 'Poppins Medium', color: Colors.blueAccent),
      ),
    );
  }
}
