import 'package:electronicsstrore/business_logic/cubit/auth_cubit.dart';
import 'package:electronicsstrore/presentation/widgets/TFF.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number/phone_number.dart';
import 'package:lottie/lottie.dart';
import '../../utilities/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final countryPicker = const FlCountryCodePicker();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String errorMsg = '';
  CountryCode? countryFlag =
      const CountryCode(name: 'Egypt', code: 'EG', dialCode: '+20');
  @override
  Widget build(BuildContext context) {
    final loginData = BlocProvider.of<AuthCubit>(context).verifyPhoneModel;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Lottie.asset("assets/images/login.json")),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: const Color.fromRGBO(7, 9, 77, 0.6),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: CustomTextFormField(
                  controller: _name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "name is Required";
                    }
                    return null;
                  },
                  hintText: "Enter your Name",
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: const Color(0xFFD1D1D1))),
                width: double.infinity,
                height: 67,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Phone is Required";
                    } else if (value.length < 10) {
                      return "phone number must be more than 10 and less than 15";
                    }
                    return null;
                  },
                  controller: _phone,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Enter Phone Number',
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        InkWell(
                          onTap: () async {
                            var _temp = countryFlag;
                            var flag = await countryPicker.showPicker(
                                context: context);
                            flag ??= _temp;
                            setState(() {
                              countryFlag = flag;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                /// country flag container
                                child: countryFlag != null
                                    ? countryFlag!.flagImage
                                    : const SizedBox(),
                              ),
                              const SizedBox(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                ),
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                width: 150,
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return state is AuthLoaded
                        ? ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await BlocProvider.of<AuthCubit>(context)
                                    .verifyPhone(
                                        name: _name.text, phone: _phone.text)
                                    .then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(state.data.message),
                                    ),
                                  );

                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.otp,
                                    arguments: {
                                      "num": _phone.text.toString(),
                                      "code": state.data.code
                                    },
                                  );
                                });
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
                                      const Color.fromRGBO(7, 9, 77, 1)),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        : const Center(child: CircularProgressIndicator());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
