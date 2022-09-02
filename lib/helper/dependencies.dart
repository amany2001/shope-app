
import 'package:shope_app/controllers/cart_controoler.dart';
import 'package:shope_app/controllers/populer_product_controllers.dart';
import 'package:shope_app/controllers/recommended_producr_controller.dart';
import 'package:shope_app/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:shope_app/data/repository/cart_repo.dart';
import 'package:shope_app/data/repository/populer_product_repo.dart';
import 'package:shope_app/data/repository/recommended_producr_repo.dart';
import 'package:shope_app/utils/app_constents.dart';

Future<void> init() async{
  //api client
  Get.lazyPut(()=> ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
   Get.lazyPut(() => PopulerProductRepo(apiClient: Get.find()));
   Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
   Get.lazyPut(() => CartRepo());

   //Controllers
   Get.lazyPut(() => PopulerProductController(populerProductRepo: Get.find()));
   Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
   Get.lazyPut(() => CartController(cartRepo: Get.find())); 
}