import 'package:electronicsstrore/presentation/widgets/TFF.dart';
import 'package:flutter/material.dart';

class OTP extends StatelessWidget {
  final String num;
  final String code;
  const OTP({super.key, required this.num, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Phone"),
      ),
      body: Column(
        children: [
          Row(
            children: [
             
            ],
          )
        ],
      ),
    );
  }
}
