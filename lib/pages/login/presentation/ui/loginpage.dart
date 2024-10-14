import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialmedia/common/component/button/button_component.dart';
import 'package:socialmedia/common/responsive/screenUtils.dart';
import 'package:socialmedia/pages/creataccount/presentation/ui/create_account.dart';

import '../../../../common/component/button/text_button.dart';
import '../../../../common/component/page_heading/black_page_heading.dart';
import '../../../../common/component/page_heading/page_subheading_title.dart';
import '../../../../common/component/textfield/textfiled_mobile.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool keepMeSignedIn = false;
  TextEditingController emailController = TextEditingController();
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
                title: "Login",
              ),
              SizedBox(height: ScreenUtils.height(context) * 0.01),
              const PageSubheadingTitle(
                subtitle: "Welcome back to the app",
              ),
              SizedBox(height: ScreenUtils.height(context) * 0.04),
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password action
                  },
                  child: const Text("Forgot Password?",style: TextStyle(
                    color: Colors.blueAccent,fontFamily: 'Poppins Regular'
                  ),),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: keepMeSignedIn,
                    onChanged: (value) {
                      setState(() {
                        keepMeSignedIn = value!;
                      });
                    },
                  ),
                  const Text("Keep me signed in",style: TextStyle(
                      color: Colors.blueAccent,fontFamily: 'Poppins Regular'
                  )),
                ],
              ),
              SizedBox(height: ScreenUtils.height(context) * 0.02),
              CommonButton(title: "Login", onPressed: (){}),
              SizedBox(height: ScreenUtils.height(context) * 0.03),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or sign in with"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: ScreenUtils.height(context) * 0.03),
              ElevatedButton.icon(
                onPressed: () {
                  // Google sign-in action
                },
                icon:  const Icon(FontAwesomeIcons.google,color: Colors.blueAccent,),
                label:  Text("Continue with Google",style: TextStyle(
                    color: Colors.blueAccent,
                    fontFamily: 'Poppins Medium',
                    fontSize: ScreenUtils.width(context) * 0.04),),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: const BorderSide(color: Colors.blueAccent),
                ),
              ),
              const Spacer(), // Add some spacing at the bottom
              TextButtonComponent(
                title: "Create an account",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateAccount()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
