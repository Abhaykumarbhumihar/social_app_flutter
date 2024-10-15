import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialmedia/pages/creataccount/presentation/ui/congralution_email.dart';

import '../../../../common/component/button/button_component.dart';
import '../../../../common/component/button/text_button.dart';
import '../../../../common/component/page_heading/black_page_heading.dart';
import '../../../../common/component/page_heading/page_subheading_title.dart';
import '../../../../common/component/textfield/textfiled_mobile.dart';
import '../../../../common/responsive/screenUtils.dart';
import '../../../../common/routes/routes.dart';
import '../../../login/presentation/ui/loginpage.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: ScreenUtils.height(context) * 0.05),
              const BlackPageHeading(
                title: "Create an account",
              ),
              const SizedBox(height: 5),
              const PageSubheadingTitle(
                subtitle: "Welcome back to the app",
              ),
              SizedBox(height: ScreenUtils.height(context) * 0.05),
              CustomTextInputMobile(
                controller: nameController,
                title: "Name",
                isPass: false,
                isSuffix: false,
              ),
              SizedBox(height: ScreenUtils.height(context) * 0.03),
              CustomTextInputMobile(
                controller: emailController,
                title: "Email",
                isPass: false,
                isSuffix: false,
              ),
              SizedBox(height: ScreenUtils.height(context) * 0.03),
              CustomTextInputMobile(
                controller: passController,
                title: "Password",
                isPass: true,
                isSuffix: true,
              ),
              SizedBox(height: ScreenUtils.height(context) * 0.04),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: RichText(
                  text: TextSpan(
                    text: 'By continuing, you agree to our ',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins Regular',
                        decorationColor: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'terms of service.',
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blueAccent,
                            fontFamily: 'Poppins Regular'),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: ScreenUtils.height(context) * 0.03),
              CommonButton(title: "Sign up", onPressed: () {}),
              SizedBox(height: ScreenUtils.height(context) * 0.03),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or sign up with"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: ScreenUtils.height(context) * 0.03),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CongratulationsScreen()),
                  );
                },
                icon: const Icon(
                  FontAwesomeIcons.google,
                  color: Colors.blueAccent,
                ),
                label: Text(
                  "Continue with Google",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: 'Poppins Medium',
                      fontSize: ScreenUtils.width(context) * 0.04),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: const BorderSide(color: Colors.blueAccent),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtils.width(context) * 0.035,
                        fontFamily: 'Poppins Regular',
                        decorationColor: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign in here.',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: ScreenUtils.width(context) * 0.035,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blueAccent,
                            fontFamily: 'Poppins Regular'),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(context, AppRoutes.LOGIN);

                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
