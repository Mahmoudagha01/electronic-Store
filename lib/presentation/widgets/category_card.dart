import 'package:flutter/material.dart';


class CategoryCard extends StatefulWidget {
  const CategoryCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  final List<Map<String, dynamic>> categories = [
    {
      "name": 'All',
      "image": "assets/images/cup.png",
      "isSelected": true,
    },
    {
      "name": 'Acer',
      "image": "assets/images/predator.png",
      "isSelected": false,
    },
    {
      "name": 'Razer',
      "image": "assets/images/razer.png",
      "isSelected": false,
    },
    {
      "name": 'Apple',
      "image": "assets/images/ios.png",
      "isSelected": false,
    },
  ];

  int currentIndex = 0;

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          categories[currentIndex]["isSelected"] = false;
          currentIndex = widget.index;
          categories[currentIndex]["isSelected"] = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 60,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(1, 0),
                        spreadRadius: 0,
                        blurRadius: 4,
                        color: Colors.grey)
                  ],
                  color: categories[widget.index]["isSelected"]
                      ? const Color.fromARGB(153, 134, 134, 151)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(categories[widget.index]["image"]!))),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              categories[widget.index]["name"]!,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: const Color.fromRGBO(
                      7,
                      9,
                      77,
                      0.6,
                    ),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
