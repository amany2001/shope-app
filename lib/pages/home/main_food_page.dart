import 'package:flutter/material.dart';
import 'package:shope_app/pages/home/food_page_body.dart';


import 'package:shope_app/utils/app_colors.dart';
import 'package:shope_app/utils/dimantions.dart';
import 'package:shope_app/widgets/big_text.dart';
import 'package:shope_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          //Showing the header 

          
          Container(


            child: Container(
                margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(left: Dimensions.width20 , right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 Column(
              children: [
                BigText(text: 'Bangladesh' , color: AppColors.mainColor, ),
                Row(children: [
                  SmallText(text: 'Narsingdi' , color: Colors.black54,),
                  Icon(Icons.arrow_drop_down_rounded,)
                ],)
              ],
            ),
            Center(
              child: Container(
                width: Dimensions.height45,
                height: Dimensions.height45,
                child: Icon(Icons.search , color: Colors.white, size: Dimensions.iconSize24,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: AppColors.mainColor,
          
                ),
          
              ),
            )
                  ],
                ),
              ),
          ),

          //Showing the body
          Expanded(
            child: SingleChildScrollView(
            child: FoodPageBody(),
          ))

        ],
      ),
     
    )
    ;
  }
}