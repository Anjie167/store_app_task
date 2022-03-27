
import 'package:store_app_task/provider/models.dart';
import 'package:http/http.dart' as http;

class StoreAPI{
  Future<List<Products>> getProducts()async{
    String uri = 'https://fakestoreapi.com/products';
    var response = await http.get(Uri.parse(uri));
    final parseData = productsFromMap(response.body);
    final products = parseData;
    return products;

  }
}

// class CartAPI {
//   Future<List<Product>> getCart() async {
//     String uri = 'https://fakestoreapi.com/products';
//     var response = await http.get(Uri.parse(uri));
//     print(response.body);
//
//     if(response.statusCode == 200) {
//       final parseData = cartFromMap(response.body);
//       List<Product> cart = parseData.products;
//       return cart;
//     }else{
//       throw Exception('Failed');
//     }
//   }
// }