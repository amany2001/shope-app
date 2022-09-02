import 'package:flutter/material.dart';

import 'package:shope_app/utils/app_colors.dart';
import 'package:shope_app/utils/dimantions.dart';
import 'package:shope_app/widgets/big_text.dart';
import 'package:shope_app/widgets/icon_and_text_widget.dart';
import 'package:shope_app/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column
              (
                
                crossAxisAlignment: CrossAxisAlignment.start,children: [
               
                BigText(text: text , size: Dimensions.font26,),
                SizedBox(height: Dimensions.height10,),
                Row(
                  
                  children: [
                    Wrap(
                      children: List.generate(5, (index) => Icon(Icons.stars, color:AppColors.mainColor , size: 15,))
    
                    ,),
                    SizedBox(width: Dimensions.width10,),
                   SmallText(text: '4.5'),
                    SizedBox(width: Dimensions.width10,),
                   SmallText(text: '1287'),
                    
                   SmallText(text: 'Comment'),
                    
                  ],
                ),
                 SizedBox(height:Dimensions.height20,),
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
              ],);
  }
}
