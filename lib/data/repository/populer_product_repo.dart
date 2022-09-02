import 'package:get/get.dart';

import 'package:shope_app/data/api/api_client.dart';
import 'package:shope_app/utils/app_constents.dart';

class PopulerProductRepo extends GetxService {
  final ApiClient apiClient;
  PopulerProductRepo({
    required this.apiClient,
  });

  Future<Response> getPopulerProductList() async{
    return await apiClient.getData(AppConstants.POPULER_PRODUCT_URL);
  }
}
