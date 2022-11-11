import 'package:electronicsstrore/helper/remote/network_helper.dart';

import '../../utilities/constants.dart';

class ProductApi {
  Future<Map<String, dynamic>> getProducts() async {
    Map<String, dynamic> response =
        await NetworkProvider().get(url: "$baseUrl$getProductsEndPoint");
    return response;
  }
}
