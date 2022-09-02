import 'package:flutter/material.dart';
import 'package:shope_app/controllers/cart_controoler.dart';
import 'package:shope_app/controllers/populer_product_controllers.dart';
import 'package:shope_app/pages/home/main_food_page.dart';
import 'package:shope_app/rout/rout_helper.dart';
import 'package:shope_app/utils/app_colors.dart';
import 'package:shope_app/utils/app_constents.dart';
import 'package:shope_app/utils/dimantions.dart';
import 'package:shope_app/widgets/app_column.dart';
import 'package:shope_app/widgets/app_icon.dart';
import 'package:shope_app/widgets/big_text.dart';
import 'package:shope_app/widgets/expandable_text.dart';
import 'package:get/get.dart';

class PopulerFoodDetail extends StatelessWidget {
  final int pageId;
 const  PopulerFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopulerProductController>().populerProductList[pageId];
   Get.find<PopulerProductController>().initProduct(product ,Get.find<CartController>());
   print('page id is'+ pageId.toString());
    print("Product name is" + product.name.toString());
    return Scaffold(
      backgroundColor:Colors.white ,
      body: Stack(children: [
        //background image
        Positioned(
          left: 0,
          right:0,
          child: Container(
            width: double.maxFinite,
            height: Dimensions.populerFoodImgSize,
            decoration: BoxDecoration(
              
              image: DecorationImage(
                fit: BoxFit.cover,
                image:NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!))
            ),


        ),),

        //icon widget
        Positioned(
          top: Dimensions.height45,
          left: Dimensions.width20,
          right: Dimensions.width20,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(RoutHelper.getInitial());
              },
              child: AppIcon(icon: Icons.arrow_back_ios)),
            GetBuilder<PopulerProductController>
            (builder: (controller){
              return Stack(
                children: [
                  AppIcon(icon: Icons.shopping_cart_checkout_outlined),
                  Get.find<PopulerProductController>().totalItems>= 1?
                  Positioned(
                    right: 0, top:0,
                    child: AppIcon(icon: Icons.circle , size:20,
                     iconColor: Colors.transparent,
                      backgroundColor: AppColors.mainColor,)
                      )
                  :Container(),
                  Get.find<PopulerProductController>().totalItems>= 1?
                  Positioned(
                    right: 3, top:3,
                    
                    child: BigText(text:Get.find<PopulerProductController>().totalItems.toString(),
                    size: 12 , color: Colors.white,
                    )
                    )
                      
                  :Container()
                ],
              );
            })

          ],)),

          //introduction to food

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.populerFoodImgSize-20,
            child: Container(
              
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,
              top: Dimensions.height20,

              ),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                  ),
                color: Colors.white,
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                AppColumn(text: product.name!),
                SizedBox(height: Dimensions.height20),
                BigText(text: 'Introduce'),
                SizedBox(height: Dimensions.height20),

                //Expanded text
                Expanded(child:
                 SingleChildScrollView(child: 
                 ExpandableTextWidget(
                  text:product.description! ))),

              ],)

          )),
          
      ],),
      
      bottomNavigationBar: GetBuilder<PopulerProductController>(
       //populerProduct is an instance of PPC
        builder:(populerProduct){ 
          return Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top:Dimensions.height30, bottom: Dimensions.height30 , left: Dimensions.width20,right: Dimensions.width20 ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
            
          ),
          color: AppColors.buttonbackgroundolor,

        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),

          child: Row(children: 
          [
            GestureDetector(
              onTap: () {
                populerProduct.setQuantity(false);
              },
              child: Icon(Icons.remove, color:AppColors.signColor,)),
          SizedBox(width: Dimensions.width10/2,),
          BigText(text: populerProduct.inCartItems.toString()),
          SizedBox(width: Dimensions.width10/2,),
          GestureDetector(
            onTap:() {
              populerProduct.setQuantity(true);
              
            }, 
            child: Icon(Icons.add , color: AppColors.signColor,)),

              ],

              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              child: BigText(text: '\$ ${product.price} | Add to cart',
              color: Colors.white,
              ),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,

              )
            )


            
          
        ]),
      );
        } ,)
    );
  }
}