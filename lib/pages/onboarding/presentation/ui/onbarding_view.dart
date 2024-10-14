import 'package:flutter/material.dart';

import '../../domain/enitity/onboarding_model.dart';

class OnBoardinView extends StatelessWidget {
  final OnboardingContent onboardingContent;

  OnBoardinView({super.key, required this.onboardingContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Image.asset(
            onboardingContent.assetImage,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 20),
          Text(
            onboardingContent.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontFamily: 'Poppins SemiBold'),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              onboardingContent.subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black26, fontFamily: 'Poppins Medium'),
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
