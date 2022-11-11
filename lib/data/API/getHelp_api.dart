import 'package:electronicsstrore/helper/remote/network_helper.dart';
import 'package:electronicsstrore/utilities/constants.dart';

class HelpApi {
  Future<Map<String, dynamic>> getHelp() async {
    Map<String, dynamic> response =
        await NetworkProvider().get(url: "$baseUrl$getHelpEndPoint");
    return response;
  }
}
