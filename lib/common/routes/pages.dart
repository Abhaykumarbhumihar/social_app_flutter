import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia/common/routes/routes.dart';
import 'package:socialmedia/pages/creataccount/presentation/ui/congralution_email.dart';
import 'package:socialmedia/pages/creataccount/presentation/ui/create_account.dart';
import 'package:socialmedia/pages/login/presentation/ui/loginpage.dart';
import 'package:socialmedia/pages/onboarding/presentation/bloc/onbarding_bloc.dart';
import 'package:socialmedia/pages/onboarding/presentation/ui/onbarding_view.dart';

import '../../pages/onboarding/presentation/ui/onboarding_page.dart';

class AppPages {
  static List<PageEntitiy> routes() {
    return [
      PageEntitiy(
          route: AppRoutes.ONBOARDING,
          page: WelcomeScreen(),
          bloc: BlocProvider(create: (_) {
            return OnbardingBloc();
          })),
      PageEntitiy(
        route: AppRoutes.LOGIN,
        page: LoginScreen(),
      ),
      PageEntitiy(route: AppRoutes.CREATEACCOUNT, page: CreateAccount()),
      PageEntitiy(
          route: AppRoutes.SEND_EMAIL_CONGRALUTION,
          page: CongratulationsScreen())
    ];
  }

  static List<dynamic> allblocProvider(BuildContext context) {
    List<dynamic> blocProvider = <dynamic>[];
    for (var blocEntity in routes()) {
      if (blocEntity.bloc != null) {
        blocProvider.add(blocEntity.bloc);
      }
    }
    return blocProvider;
  }

  static MaterialPageRoute GenerateRoutesSetting(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("In valid route name ${settings.name}");
    return MaterialPageRoute(builder: (_) => WelcomeScreen());
  }
}

class PageEntitiy {
  String route;
  Widget page;
  dynamic bloc;

  PageEntitiy({required this.route, required this.page, this.bloc});
}
