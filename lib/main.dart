import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia/common/routes/pages.dart';
import 'package:socialmedia/pages/onboarding/presentation/bloc/onbarding_bloc.dart';
import 'package:socialmedia/pages/onboarding/presentation/ui/onboarding_page.dart';

import 'common/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allblocProvider(context)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppPages.GenerateRoutesSetting,
        initialRoute: AppRoutes.ONBOARDING,
        home: WelcomeScreen(),
      ),
    );
  }
}
