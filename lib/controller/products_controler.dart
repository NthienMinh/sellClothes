import 'package:mobile_ui/controller/base_api.dart';
import 'package:mobile_ui/models/product.dart';

class ProductsController {
  ProductsController._();
  static Future<void> getProducts() async {
    List<Product> products = [];
    String productsAdd = "/products";
    BaseAPI _baseAPI = BaseAPI();
    await _baseAPI.getData(productsAdd).then((value) {
      if (value.apiStatus == API_STATUS.SUSSCESSED) {
        value.object.forEach((element) {
          products.clear();
          products.add(Product.fromJson(element));
        });
      }
    });
  }
}
