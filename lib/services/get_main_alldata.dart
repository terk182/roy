import 'package:foodie_ui_kit/models/all.dart';
import 'package:foodie_ui_kit/theme/api_path.dart';
import 'package:http/http.dart' as http;

class get_all {
  Future<Allmodel> get_data_api() async {
    var url = Uri.parse(Url_main_data);
    var response = await http.get(url);

    var result = allmodelFromJson(response.body);

    return result;
  }
}
