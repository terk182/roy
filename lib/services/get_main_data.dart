import 'package:foodie_ui_kit/models/maindata.dart';
import 'package:foodie_ui_kit/theme/api_path.dart';
import 'package:http/http.dart' as http;

class get_main {
  Future<Maindata> get_data_api() async {
    var url = Uri.parse(Url_main_data);
    var response = await http.get(url);

    var result = maindataFromJson(response.body);

    return result;
  }
}
