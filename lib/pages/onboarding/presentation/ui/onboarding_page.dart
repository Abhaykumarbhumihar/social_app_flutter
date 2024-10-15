import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:socialmedia/common/responsive/screenUtils.dart';
import 'package:socialmedia/pages/onboarding/presentation/bloc/onbarding_bloc.dart';
import 'package:socialmedia/pages/onboarding/presentation/ui/onbarding_view.dart';

import '../../../../common/component/button/button_component.dart';
import '../../../../common/component/button/text_button.dart';
import '../../../../common/routes/routes.dart';
import '../../../login/presentation/ui/loginpage.dart';
import '../../domain/enitity/onboarding_model.dart';

class WelcomeScreen extends StatelessWidget {
  final controllerPager = PageController(initialPage: 0);

  final List<OnboardingContent> onboardingPages = [
    OnboardingContent(
      title: "Welcome to the app",
      subtitle:
          "We’re excited to help you book and manage your service appointments with ease.",
      assetImage: 'assets/images/onboarding.webp',
    ),
    OnboardingContent(
      title: "Book Appointments",
      subtitle: "Quickly book your appointments through the app.",
      assetImage: 'assets/images/onboarding.webp',
    ),
    OnboardingContent(
      title: "Manage Services",
      subtitle: "Easily manage your ongoing and upcoming services.",
      assetImage: 'assets/images/onboarding.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: ScreenUtils.width(context),
        height: ScreenUtils.height(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: ScreenUtils.height(context) * 0.7,
              child: BlocBuilder<OnbardingBloc, OnboardingPageState>(
                builder: (context, state) {
                  return PageView.builder(
                      onPageChanged: (index) {
                        BlocProvider.of<OnbardingBloc>(context)
                            .add(OnboardingNextPage(index));
                      },
                      itemCount: onboardingPages.length,
                      reverse: false,
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: controllerPager,
                      itemBuilder: (BuildContext context, int index) {
                        return OnBoardinView(
                          onboardingContent: onboardingPages[index],
                        );
                      });
                },
              ),
            ),
            SmoothPageIndicator(
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.blueAccent,
                offset: 8.0,
                dotWidth: 6,
                dotHeight: 6,
                dotColor: Colors.black26,
              ),
              count: onboardingPages.length,
              controller: controllerPager,
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<OnbardingBloc, OnboardingPageState>(
              builder: (context, state) {
                return CommonButton(
                  title: state.currentPage == onboardingPages.length - 1
                      ? "Login"
                      : "Next",
                  onPressed: () {
                    if (state.currentPage == onboardingPages.length - 1) {
                      Navigator.pushReplacementNamed(context, AppRoutes.LOGIN);


                    } else {
                      int nextPage = state.currentPage + 1;
                      controllerPager.jumpToPage(nextPage);
                      BlocProvider.of<OnbardingBloc>(context)
                          .add(OnboardingNextPage(nextPage));
                    }
                  },
                );
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextButtonComponent(
                  title: "Create an account", onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
