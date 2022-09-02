import 'package:get/get.dart';

import 'package:shope_app/data/api/api_client.dart';
import 'package:shope_app/utils/app_constents.dart';

class RecommendedProductRepo extends GetxController {
  final ApiClient apiClient;
  RecommendedProductRepo({
    required this.apiClient,
  });

  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URL);
  }
}