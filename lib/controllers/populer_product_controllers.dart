import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_app/controllers/cart_controoler.dart';
import 'package:shope_app/data/repository/populer_product_repo.dart';
import 'package:shope_app/models/product_model.dart';
import 'package:shope_app/utils/app_colors.dart';


class PopulerProductController extends GetxController {
  final PopulerProductRepo populerProductRepo ;
  PopulerProductController({
    required this.populerProductRepo,
  });
  List<ProductsModel> _populerProductList = [];
  List<ProductsModel> get populerProductList => _populerProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0; 
  int get quantity => _quantity;
  int _inCartItems=0;
  int get inCartItems => _inCartItems+_quantity;
  late CartController _cart;


  Future<void> getPopulerProductList() async{
    Response response = await populerProductRepo.getPopulerProductList();
    if(response.statusCode == 200){
      
      print('got product');
      _populerProductList = [];
      _populerProductList.addAll(Product.fromJson(response.body).products);
     print('_populerProductList');
     _isLoaded = true;
     update();
    }else{

    }}
    //checking method
     int checkQuantity(int quantity){
      if(_inCartItems+quantity < 0){
        Get.snackbar('Item count', 'You cen\'t reduce more!',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white)
        ;
        return 0;
      }
      else if (_inCartItems+quantity> 20){
        Get.snackbar('Item count', 'You cen\'t add more!',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white);
        return 20;
      }else{
        return quantity;
      }
    }
    //setQuantity method
      void setQuantity(bool isIncrement){
      if(isIncrement){
        _quantity = checkQuantity(_quantity+1);

      }else{
         _quantity = checkQuantity(_quantity-1);

      }
      update();
    }
   
    void initProduct(ProductsModel product, CartController cart){
      _quantity = 0;
      _inCartItems = 0;
      _cart = cart;
      var exist = false;
      exist = _cart.existInCart(product);

      //if exist
      //get from storage _inCartItems = 3
      print('exist or not'+exist.toString());

      if(exist){
        _inCartItems = _cart.getQuantity(product);

      }
      print('the quantity in the cart is '+_inCartItems.toString());
    }

    void addItem(ProductsModel product){

    

        _cart.addItem(product, _quantity);
        _quantity =0;
        _inCartItems = _cart.getQuantity(product);

        _cart.items.forEach((key, value) {
          print('The id is'+value.id.toString()+'the quantity is'+value.toString());
        });
        update();
   
    }

    int get totalItems{
      return _cart.totalItems;
    }

   
      
  }



