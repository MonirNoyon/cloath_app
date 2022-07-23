import 'package:cloath_app/model/product_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices{
  static var client = http.Client();

  static Future<List<ProductModel>> fetchProducts() async {

    var response = await client.get(Uri.parse("https://fakestoreapi.com/products"));

    if(response.statusCode == 200){
      return productFromJson(response.body);
    }else{
      return [];
    }

  }
}