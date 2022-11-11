import 'package:electronicsstrore/data/models/product_model.dart';
import 'package:electronicsstrore/presentation/screens/help.dart';
import 'package:electronicsstrore/presentation/screens/login.dart';
import 'package:electronicsstrore/presentation/screens/otp.dart';
import 'package:electronicsstrore/presentation/screens/productdetails.dart';
import 'package:electronicsstrore/utilities/routes.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/home.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(builder: (context) => const Login());

    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const Home());

    case AppRoutes.otp:
      final phone = settings.arguments as String;
      final code = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OTP(num: phone, code: code));

    case AppRoutes.details:
      final product = settings.arguments as Product;
      return MaterialPageRoute(
          builder: (context) => ProductDetails(product: product));

          case AppRoutes.help:
      return MaterialPageRoute(builder: (context) => const Help());
    default:
      return MaterialPageRoute(builder: ((context) => const Login()));
  }
}
