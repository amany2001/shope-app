

import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_app/controllers/populer_product_controllers.dart';
import 'package:shope_app/controllers/recommended_producr_controller.dart';
import 'package:shope_app/models/product_model.dart';
import 'package:shope_app/pages/food/populer_food_detail.dart';
import 'package:shope_app/rout/rout_helper.dart';
import 'package:shope_app/utils/app_colors.dart';
import 'package:shope_app/utils/app_constents.dart';
import 'package:shope_app/utils/dimantions.dart';
import 'package:shope_app/widgets/app_column.dart';

import 'package:shope_app/widgets/big_text.dart';
import 'package:shope_app/widgets/icon_and_text_widget.dart';
import 'package:shope_app/widgets/small_text.dart';



class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scalFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
 
   @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        
      });
    });

    @override
    void dispose(){
      pageController.dispose();
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider Section
       GetBuilder<PopulerProductController>(builder: (popularProducts){
       return popularProducts.isLoaded?Container(
          height:Dimensions.pageView ,
          
            
            child: PageView.  builder(
              controller: pageController,
              itemCount: popularProducts.populerProductList.length,
              itemBuilder: (context, position){
              return _buildPageItem(position, popularProducts.populerProductList[position]);
            }),
         
          ):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
       }),

       //The Dots Shape
       GetBuilder<PopulerProductController>(builder: (popularProducts){
        return  DotsIndicator(
        dotsCount: popularProducts.populerProductList.isEmpty?1:popularProducts.populerProductList.length,
         position: _currentPageValue,
        decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
);
       },),



          


//Poupuler text
SizedBox(height : Dimensions.height30),
Container(
  margin: EdgeInsets.only(left: Dimensions.width30),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
    BigText(text: 'Recommended'),
    SizedBox(width: Dimensions.width10,),
    Container
    (
      margin: const EdgeInsets.only(bottom : 3),
      child:
     BigText(
      text: "." ,
      color: Colors.black26,),
    
    ),

    SizedBox(width: Dimensions.width10,),
    Container(
      margin: const EdgeInsets.only(bottom : 2),
      child: SmallText(text: 'Food pairing'),)

  ]),
),

 //Recommended Food
 //List of food and images

 
  
  
   GetBuilder<RecommendedProductController>(builder: (recommendedProudect){
    return recommendedProudect.isLoaded?ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
  itemCount: recommendedProudect.recommendedProductList.length,
  itemBuilder: ( (context, index) {

    return GestureDetector
    (
      onTap: (() {
        Get.toNamed(RoutHelper.getRecommendedFood(index));
      }),

      child: Container(
        margin: EdgeInsets.only(left: Dimensions.width20 , right:Dimensions.width20  , bottom: Dimensions.height10),
        child: Row(children:[
          //image section in the menue
          Container(
            width: Dimensions.listViewImgSize,
            height: Dimensions.listViewImgSize,
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(Dimensions.radius20),
              color: Colors.white38,
              image: DecorationImage( 
                fit: BoxFit.cover,
                image: NetworkImage(
                  AppConstants.BASE_URL+ AppConstants.UPLOAD_URL+recommendedProudect.recommendedProductList[index].img))
            ),
            ),
          
        
          
    
       //text container
       Expanded(
    
         child: Container(
          height: Dimensions.listViewTextSize,
         
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.radius20),
              bottomRight: Radius.circular(Dimensions.radius20),
            ),
            color: Colors.white,
       
          ),
          child:Padding(
            padding: EdgeInsets.only(left: Dimensions.width10 , right: Dimensions.width10 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              BigText(text: recommendedProudect.recommendedProductList[index].name),
              SizedBox(height: Dimensions.height10,),
              SmallText(text:'Any thinh for now'),// recommendedProudect.recommendedProductList[index].description!),
              SizedBox(height: Dimensions.height10,),
               Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    IconAndTextWidget(
                     iconData: Icons.circle_sharp,
                      text: 'Normal',
                      iconColor: AppColors.iconColor1,),
                      
      
                      IconAndTextWidget(
                      iconData: Icons.location_on,
                      text: '1.7Km',
                      iconColor: AppColors.mainColor,),
    
                      
      
                      IconAndTextWidget(
                      iconData: Icons.access_alarm_rounded,
                      text: '32min',
                      iconColor: AppColors.iconColor2,),
      
                  ],)
             
                  
    
            ],),) ,
    
         ),
       )
        ],
      )),
    );
   
 })):CircularProgressIndicator(
  color: AppColors.mainColor,);
   })

      ],
    );
    
  }
  Widget _buildPageItem(int index, ProductsModel populerProduct){
    Matrix4 matrix =  Matrix4.identity();
    if(index == _currentPageValue.floor()){
      var currentScale = 1 - (_currentPageValue - index) * (1- _scalFactor);
      var currentTrans = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0,currentTrans , 0);

    }
    else if(index == _currentPageValue.floor()+1){
      var currentScale = _scalFactor + (_currentPageValue - index + 1) *(1- _scalFactor);
      var currentTrans = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0,currentTrans , 0);
    }
    else if(index == _currentPageValue.floor()-1){
      var currentScale = 1 - (_currentPageValue - index) * (1- _scalFactor);
      var currentTrans = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0,currentTrans , 0);
    } else{
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0,_height*(1 - _scalFactor/2) , 1);

    }
    //move  to populer
    return Transform(
      transform: matrix,
      child: Stack(
        children:[ GestureDetector(
          onTap: () {
              Get.toNamed(RoutHelper.getPopularFood(index));
              
            },
          child: Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10) ,
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(Dimensions.radius30),
            
              color:index.isEven?Color(0xFF69c5df): Color(0xFF9294cc),
              image:  DecorationImage(
                fit: BoxFit.cover,
               image:  NetworkImage(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+ populerProduct.img!
               )
              ) ,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30 , bottom: Dimensions.height30),
    
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(Dimensions.radius20),
            
              color:Colors.white,
              boxShadow:const[
                BoxShadow(color: Color(0xFFe8e8e8),
                blurRadius: 5.0 ,
                offset: Offset(0, 5)),
                
                
                BoxShadow(color: Colors.white,
                offset: Offset(-5, 0)),

                BoxShadow(color: Colors.white,
                offset: Offset(5, 0)),

                
              ] 
              
            ),
            child: Container(
              padding: EdgeInsets.only(top: Dimensions.height15 , left: Dimensions.width15 , right: Dimensions.width15),
              child: AppColumn(text:populerProduct.name! ,),
            ),
          ),
        )
        ] 
      ),
    );
  }
}