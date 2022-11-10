import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:electronicsstrore/data/API/verifyotp_api.dart';
import 'package:electronicsstrore/helper/notification/notifications.dart';
import 'package:electronicsstrore/presentation/widgets/TFF.dart';
import 'package:electronicsstrore/utilities/routes.dart';

import '../../business_logic/OtpAuth/otp_auth_cubit.dart';

class OTP extends StatefulWidget {
  final String num;
  final String code;
  const OTP({super.key, required this.num, required this.code});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  NotificationService notificationService = NotificationService();
  Timer? timer;
  final TextEditingController oneController = TextEditingController();
  final TextEditingController twoController = TextEditingController();
  final TextEditingController threeController = TextEditingController();
  final TextEditingController fourController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void notify() {
    notificationService.showNotifications(code: widget.code);
  }

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 2), notify);
  }

  @override
  Widget build(BuildContext context) {
    void onChange(String value) {
      if (value.length == 1) {
        FocusScope.of(context).nextFocus();
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF1a2980),
                Color(0xFF26d0ce),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Verify Phone",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                ),
                const Spacer(),
                FittedBox(
                  child: Text(
                    "We have sent the activation code to ${widget.num}",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                ),
                const Spacer(),
                Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: oneController,
                          onChanged: onChange,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter the code";
                            } else if (value.length > 1) {
                              return "Enter only one number in each field";
                            }
                            return null;
                          },
                          textAlign: TextAlign.center,
                          fillcolor: Colors.white,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          controller: twoController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter the code";
                            } else if (value.length > 1) {
                              return "Enter only one number in each field";
                            }
                            return null;
                          },
                          onChanged: onChange,
                          textAlign: TextAlign.center,
                          fillcolor: Colors.white,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          controller: threeController,
                          onChanged: onChange,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter the code";
                            } else if (value.length > 1) {
                              return "Enter only one number in each field";
                            }
                            return null;
                          },
                          textAlign: TextAlign.center,
                          fillcolor: Colors.white,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          controller: fourController,
                          onChanged: onChange,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter the code";
                            } else if (value.length > 1) {
                              return "Enter only one number in each field";
                            }
                            return null;
                          },
                          textAlign: TextAlign.center,
                          fillcolor: Colors.white,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                TextButton(
                  child: const Text(
                    "Resend Code",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    await Future.delayed(const Duration(seconds: 2));
                    notify();
                  },
                ),
                SizedBox(
                  height: 45,
                  width: 150,
                  child: BlocConsumer<OtpAuthCubit, OtpAuthState>(
                    listener: (context, state) {
                      if (state is OtpAuthsuccess && state.data.status == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.data.message,
                            ),
                          ),
                        );
                        Navigator.pushReplacementNamed(context, AppRoutes.home);
                      } else if (state is OtpAuthError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.message,
                            ),
                          ),
                        );
                      } else if (state is OtpAuthsuccess &&
                          state.data.status != 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.data.message),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return state is OtpAuthLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                          : ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await BlocProvider.of<OtpAuthCubit>(context)
                                      .verifyOTP(
                                          phone: widget.num,
                                          code: oneController.text +
                                              twoController.text +
                                              threeController.text +
                                              fourController.text);
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
                                'Verify',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            );
                    },
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
