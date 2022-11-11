import 'package:electronicsstrore/business_logic/Auth/auth_cubit.dart';
import 'package:electronicsstrore/business_logic/Help/help_cubit.dart';
import 'package:electronicsstrore/business_logic/OtpAuth/otp_auth_cubit.dart';
import 'package:electronicsstrore/business_logic/Product/product_cubit.dart';
import 'package:electronicsstrore/data/API/getHelp_api.dart';
import 'package:electronicsstrore/data/API/getProduct_api.dart';
import 'package:electronicsstrore/data/API/verifyotp_api.dart';
import 'package:electronicsstrore/data/API/verifyphone_api.dart';
import 'package:electronicsstrore/data/repository/getProduct_repo.dart';
import 'package:electronicsstrore/data/repository/gethelp_repo.dart';
import 'package:electronicsstrore/data/repository/verifyotp_repo.dart';
import 'package:electronicsstrore/data/repository/vrifyphone_repo.dart';
import 'package:electronicsstrore/helper/local/cache_helper.dart';
import 'package:electronicsstrore/helper/notification/notifications.dart';
import 'package:electronicsstrore/utilities/router.dart';
import 'package:electronicsstrore/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            AuthRepositery(
              Auth(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => OtpAuthCubit(
            OtpRepository(
              OtpAuth(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ProductCubit(
            ProductsRepositery(
              productApi: ProductApi(),
            ),
          ),
        ),
        BlocProvider(create: (context) => HelpCubit(HelpRepository(HelpApi())))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}
