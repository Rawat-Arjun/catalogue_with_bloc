import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices {
  Future<Response> getProduct() async {
    String url = 'https://dummyjson.com/products';
    Uri uri = Uri.parse(url);
    Response response = await http.get(uri);
    return response;
  }
}
