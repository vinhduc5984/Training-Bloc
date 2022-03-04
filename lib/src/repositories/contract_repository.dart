import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_screen_bloc/src/common/api_gateways.dart';
import 'package:login_screen_bloc/src/models/contract_buy_model.dart';

import 'package:login_screen_bloc/src/repositories/base_repository.dart';

class ContractRepository {
  Future<ContractBuyModel?> getDataContract(String param) async {
    print(ApiGateway.contract + param);
    http.Response response =
        await BaseRepository().get(ApiGateway.contract, param);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['data'];
      var toModel = ContractBuyModel?.fromMap(jsonResponse);
      print(toModel.toString());
      return toModel;
    }
    return null;
  }
}
