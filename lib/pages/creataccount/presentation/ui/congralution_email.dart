import 'package:flutter/material.dart';
import 'package:socialmedia/common/responsive/screenUtils.dart';

import '../../../../common/component/button/text_button.dart';
import '../../../../common/component/page_heading/black_page_heading.dart';
import '../../../../common/component/page_heading/page_subheading_title.dart';
import '../../../../common/routes/routes.dart';


class CongratulationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/congralutions.png', // Add an appropriate illustration image here

              ),
               SizedBox(height: ScreenUtils.width(context)*0.04),

              const BlackPageHeading(
                title: "Congratulations!",
              ),
              SizedBox(height: ScreenUtils.width(context)*0.02),

               const PageSubheadingTitle(
               subtitle: "We've sent you a verification email, please check your inbox and follow the instructions to verify your account.",
               ),
              const Spacer(),

              Padding(
                padding:  EdgeInsets.only(bottom: ScreenUtils.width(context)*0.03),
                child: TextButtonComponent(
                  title:"Sign in here",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.LOGIN);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
