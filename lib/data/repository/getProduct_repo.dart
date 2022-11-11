// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:electronicsstrore/data/API/getProduct_api.dart';
import 'package:electronicsstrore/data/models/product_model.dart';

class ProductsRepositery {
  final ProductApi productApi;
  ProductsRepositery({
    required this.productApi,
  });

  Future<ProductsModel> getProducts() async {
    final data = await productApi.getProducts();
    return ProductsModel.fromJson(data);
  }
}
