// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:electronicsstrore/data/repository/getProduct_repo.dart';

import '../../data/models/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
    this.productsRepositery,
  ) : super(ProductInitial());
  final ProductsRepositery productsRepositery;
  ProductsModel? products;

  Future<ProductsModel?> getProducts() async {
    try {
      emit(Productloading());
      products = await productsRepositery.getProducts();

      emit(Productloaded(products!));
    } catch (e) {
      emit(Producterror());
    }
    return products;
  }
}
