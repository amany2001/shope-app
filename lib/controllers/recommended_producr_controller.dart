import 'package:get/get.dart';

import 'package:shope_app/data/repository/populer_product_repo.dart';
import 'package:shope_app/data/repository/recommended_producr_repo.dart';
import 'package:shope_app/models/product_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo ;
  RecommendedProductController({
    required this.recommendedProductRepo,
  });
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;


  Future<void> getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode == 200){
      
      print('got product');
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
     print('_recommendedProductList');
     _isLoaded = true;
     // update();
    }else{

    }
  }
}
