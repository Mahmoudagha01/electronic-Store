import 'package:electronicsstrore/business_logic/Product/product_cubit.dart';
import 'package:electronicsstrore/presentation/widgets/Carousel.dart';
import 'package:electronicsstrore/presentation/widgets/category_card.dart';

import 'package:electronicsstrore/presentation/widgets/header.dart';
import 'package:electronicsstrore/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HeaderBuilder(),
            const Carousel(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SizedBox(
                height: 85,
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryCard(index: index);
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Product",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: const Color.fromRGBO(
                            7,
                            9,
                            77,
                            0.6,
                          ),
                        ),
                  ),
                  Text(
                    "View All",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black26,
                        ),
                  ),
                ],
              ),
            ),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is Productloading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is Productloaded) {
                  return Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        itemCount: state.data.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2,
                                childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.details,
                                  arguments: state.data.products[index]);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(242, 242, 242, 1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Stack(children: [
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(
                                            15,
                                          ),
                                          topLeft: Radius.circular(
                                            6,
                                          ),
                                        ),
                                        color: Color.fromRGBO(
                                          7,
                                          9,
                                          77,
                                          0.6,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image: NetworkImage(state.data
                                                  .products[index].image))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            state.data.products[index].company,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(
                                                  color: const Color.fromRGBO(
                                                    7,
                                                    9,
                                                    77,
                                                    0.6,
                                                  ),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(state.data.products[index].name),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 8,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                              "${state.data.products[index].price} EGP"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  right: 0,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.favorite_border_outlined)),
                                ),
                              ]),
                            ),
                          );
                        }),
                  ));
                } else {
                  return const Text("Error in Fetching Data");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
