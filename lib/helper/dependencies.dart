import 'package:get/get.dart';
import 'package:mobile_ui/controllers/popular_product_controller.dart';
import 'package:mobile_ui/data/api/api_client.dart';
import 'package:mobile_ui/data/repository/popular_product_repo.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: "appBaseUrl"));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
