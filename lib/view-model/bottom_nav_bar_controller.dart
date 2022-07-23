import 'package:get/get.dart';

class BottomController extends GetxController{
  static BottomController instance = Get.find();
  var currentIndex = 0.obs;

  void currentOntap(int index){
    currentIndex.value = index;
  }
}