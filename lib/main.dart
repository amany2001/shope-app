import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_app/controllers/populer_product_controllers.dart';
import 'package:shope_app/controllers/recommended_producr_controller.dart';
import 'package:shope_app/pages/food/populer_food_detail.dart';
import 'package:shope_app/pages/home/main_food_page.dart';
import 'package:shope_app/rout/rout_helper.dart';
import 'helper/dependencies.dart' as dep;



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopulerProductController>().getPopulerProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainFoodPage(),
      initialRoute: RoutHelper.initial,
      getPages: RoutHelper.routes,
    );
  }
}


 
