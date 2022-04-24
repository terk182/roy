import 'package:foodie_ui_kit/models/promotion.dart';
import 'package:foodie_ui_kit/theme/api_path.dart';
import 'package:http/http.dart' as http;

class get_promotion {
  Future<Promotion> get_data_api() async {
    var url = Uri.parse(Url_promotion_data);
    var response = await http.get(url);

    var result = promotionFromJson(response.body);

    return result;
  }
}
