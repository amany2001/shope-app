import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double pageView= screenHeight/2.64;
  //القيم يلي قسمنا عليها هي نسبة البوكس الموجود فيها الصورة بالنسبة لطول الشاشة
  // 844/220 = 3.84 , 844 : is a screen height , 220: is the container height

  static double pageViewContainer= screenHeight/3.84;
  //844/120 = 7.03 ,  844 : is a screen height , 220: is the textContainer height
  static double pageViewTextContainer= screenHeight/7.03;
//dynamic height pading and margin
  static double height10 = screenHeight/84.4;
  static double height20 = screenHeight/42.2;
  static double height15 = screenHeight/56.27;
  static double height30 = screenHeight/28.13;
  static double height45 = screenHeight/18.76;

  //dynamic width pading and margin
  static double width10 = screenWidth/84.4;
  static double width20 = screenWidth/42.2;
  static double width15= screenWidth/56.27;
  static double width30= screenWidth/28.13;
  //Font Size
      
      static double font16 = screenHeight/52.75;
      static double font20 = screenHeight/42.2;
      static double font26 = screenHeight/32.46;
      //radius
      static double radius15 = screenHeight/56.27;
      static double radius20 = screenHeight/42.2;
      static double radius30 = screenHeight/28.13;

      //icon size
      static double iconSize24 = screenHeight/35.17;
      static double iconSize16 = screenHeight/52.75;

      //List View Size 
      static double listViewImgSize = screenWidth/3.25;
      static double listViewTextSize = screenWidth/3.9;

      //Populer Food 
      static double populerFoodImgSize = screenHeight/2.41;

      //bottom height
      static double bottomHeightBar = screenHeight/7.03;




  

}