import 'package:electronicsstrore/business_logic/cubit/auth_cubit.dart';
import 'package:electronicsstrore/data/API/verifyphone_api.dart';
import 'package:electronicsstrore/data/repository/vrifyphone_repo.dart';
import 'package:electronicsstrore/utilities/router.dart';
import 'package:electronicsstrore/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepositery(Auth())),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.login,
      ),
    );
  }
}
