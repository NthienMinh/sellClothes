import 'package:get/get.dart';
import 'package:mobile_ui/data/api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient})
  Future<Response> getPopularProductList() async {}
}
