import 'package:electronicsstrore/presentation/widgets/TFF.dart';
import 'package:flutter/material.dart';

class HeaderBuilder extends StatelessWidget {
  const HeaderBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: CustomTextFormField(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search In Electronics",
              fillcolor: Colors.grey[100],
              borderRadius: 30,
              
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            color: Colors.grey[100],
            child: IconButton(
              onPressed: () {
                
              },
              icon: const Icon(
                Icons.tune_rounded,
              ),
            ),
          ),
        )
      ],
    );
  }
}
