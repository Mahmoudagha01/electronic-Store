import 'dart:async';
import 'package:electronicsstrore/utilities/routes.dart';
import 'package:flutter/material.dart';
import '../../helper/local/cache_helper.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () async {
      bool? isLogged =
          await CacheHelper.getDataFromSharedPreference(key: "isLoggedIn");
      isLogged != null
          ? Navigator.pushNamed(context, AppRoutes.home)
          : Navigator.pushNamed(context, AppRoutes.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(7, 9, 77, 0.6),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
          width: 120,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/laptop.png"),
                    ),
                  ),
                ),
              ),
              Text(
                "Electronuic Store",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
