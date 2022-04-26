import 'package:foodie_ui_kit/models/promotion_list.dart';
import 'package:foodie_ui_kit/theme/api_path.dart';
import 'package:http/http.dart' as http;

class Getpromotionlist {
  Future<Promotionlist> uid(String uid) async {
    //var url = "https://hoolha.com/terk/api/gen/products";
    print(uid);
    var url = Uri.parse(Url_promotionlist);
    var response = await http.post(url, body: {"uid": uid});

    var list = promotionlistFromJson(response.body);

    return list;
  }
}
