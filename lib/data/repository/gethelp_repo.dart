import 'package:electronicsstrore/data/API/getHelp_api.dart';
import 'package:electronicsstrore/data/models/help_model.dart';

class HelpRepository {
  final HelpApi helpApi;

  HelpRepository(this.helpApi);

  Future<HelpModel> getHelp() async {
    final data = await helpApi.getHelp();
    return HelpModel.fromJson(data);
  }
}
