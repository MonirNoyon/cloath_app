import 'package:cloath_app/model/product_model.dart';
import 'package:cloath_app/services/remote_services.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController{
  static ProductsController instance = Get.find();
  var isLoading = true.obs;
  var productsList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async{
    try{
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if(products != []){
        productsList.value = products;
      }else{

      }
    }finally{
      isLoading(false);
    }
  }
}