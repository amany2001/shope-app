import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_app/data/repository/cart_repo.dart';
import 'package:shope_app/models/cart_model.dart';
import 'package:shope_app/models/product_model.dart';
import 'package:shope_app/utils/app_colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({
    required this.cartRepo,
  });
  Map<int , CartModel> _items={};
  Map<int , CartModel> get items =>_items;


  void addItem(ProductsModel product, int quantity){
    var totalQuantity = 0;
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {

        totalQuantity = value.quantity! + quantity;

        return CartModel(
        id:value.id,
        name: value.name,
        price: value.price,
        img: value.img,
        quantity:value.quantity! +quantity,
        isExist: true,
        time: DateTime.now().toString() );

      });

      if(totalQuantity <= 0){
        _items.remove(product.id);
      }

    }else{
      if(quantity > 0){
        print('length of the item is'+_items.length.toString());
    _items.putIfAbsent(product.id!, (){
      print('adding item to the cart'+product.id!.toString()+'quantity'+quantity.toString());
      return CartModel(
      id:product.id,
      name: product.name,
      price: product.price,
      img: product.img,
      quantity: quantity,
      isExist: true,
      time: DateTime.now().toString() );}
      );
      }else{
        Get.snackbar('Item count', 'You should add at least an item!',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white);
      }
    }
  }

  bool existInCart(ProductsModel product){
    if(_items.containsKey(product.id)){
      return true;

    }
    return false;

  }

  int getQuantity(ProductsModel product){
    var quantity=0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key== product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }



}
