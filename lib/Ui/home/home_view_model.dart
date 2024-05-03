import 'package:flutter/cupertino.dart';
import 'package:nikhistacked/model/Products.dart';
import 'package:stacked/stacked.dart';

import '../../services/product_service.dart';

class HomeViewModel extends BaseViewModel{
  List<Products>? plist=[];
  ProductService productService=ProductService();
  Future<void> init() async {
    plist=await productService.fetchProducts();
    notifyListeners();
  }
  TextEditingController controller=TextEditingController();
  void submit(){
    print(controller.text);
  }
}