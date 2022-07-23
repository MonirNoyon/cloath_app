import 'package:cloath_app/view-model/bottom_nav_bar_controller.dart';
import 'package:cloath_app/view-model/product_controller.dart';
import 'package:cloath_app/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ProductsController());
  Get.put(BottomController());
  runApp( const Onboarding());
}

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 80,
          titleTextStyle: GoogleFonts.robotoSlab(
            fontSize: 25,
            color: Colors.black87
          )
        )
      ),
      getPages: [
        GetPage(name: "/", page: ()=> const HomePage())
      ],
    );
  }
}



