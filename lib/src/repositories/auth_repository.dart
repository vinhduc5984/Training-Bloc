import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_screen_bloc/src/common/api_gateways.dart';
import 'package:login_screen_bloc/src/repositories/base_repository.dart';

class AuthRepository {
  loginAPI({required String email, required String password}) async {
    var body = {"username": email, "password": password};
    http.Response response =
        await BaseRepository().post(ApiGateway.login, body);

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['message'] == "Login OK" ||
        jsonResponse['status'] == 200) {
      return jsonResponse;
    } else if (jsonResponse['status'] == 400) {
      return "Login fail";
    }
  }
}
