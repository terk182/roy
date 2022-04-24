import 'package:foodie_ui_kit/theme/api_path.dart';
import 'package:http/http.dart' as http;
import '../models/login.dart';

class Checklogin {
  Future<Login> logincheck(String phone, String password) async {
    //var url = "https://hoolha.com/terk/api/gen/products";

    var url = Uri.parse(Url_login);
    var response =
        await http.post(url, body: {"phone": phone, "password": password});

    var user = loginFromJson(response.body);

    return user;
  }
}
