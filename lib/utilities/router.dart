import 'package:electronicsstrore/presentation/screens/login.dart';
import 'package:electronicsstrore/presentation/screens/otp.dart';
import 'package:electronicsstrore/utilities/routes.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/home.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(builder: (context) => Login());

    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => Home());

    case AppRoutes.otp:
      final phone = settings.arguments as String ;
      final code = settings.arguments as String ;
      return MaterialPageRoute(builder: (context) => OTP(num: phone,code: code));

    default:
      return MaterialPageRoute(builder: ((context) => Home()));
  }
}
