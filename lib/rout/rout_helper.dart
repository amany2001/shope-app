  import 'package:get/get.dart';
import 'package:shope_app/pages/food/populer_food_detail.dart';
import 'package:shope_app/pages/food/recommended_food_detail.dart';
import 'package:shope_app/pages/home/main_food_page.dart';

class RoutHelper{
    static const String initial = '/';
    static const String popularFood = '/popular-food';
    static const String recommendedFood = '/recommended-food';

    static String getInitial()=> '$initial';
    static String getPopularFood(int pageId)=> '$popularFood? pageId = $pageId';
    static String getRecommendedFood(int pageId)=> '$recommendedFood? pageId = $pageId';
   
    static List<GetPage> routes = [

      GetPage(name: initial, page: ()=> MainFoodPage()),

      GetPage(name: popularFood, page: (){
        print('popular food get called');
        var pageId = Get.parameters['pageId'];
        return PopulerFoodDetail(pageId:int.parse(pageId!));
      },
      transition: Transition.fadeIn
      
      ),

      GetPage(name: recommendedFood, page: (){
        var pageId = Get.parameters['pageId'];
        return RecommendedFoodDetail(pageId:int.parse(pageId!));
      },
      transition: Transition.fadeIn
      
      ),
// The list of rout
    ];
  }