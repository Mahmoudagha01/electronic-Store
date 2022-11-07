import 'package:electronicsstrore/utilities/router.dart';
import 'package:electronicsstrore/utilities/routes.dart';
import 'package:flutter/material.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.login,
    );
  }
}
