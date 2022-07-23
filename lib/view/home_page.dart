import 'package:cloath_app/view-model/controller.dart';
import 'package:cloath_app/view/dashboard_page.dart';
import 'package:cloath_app/view/products_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List pages = [
      DashboardPage(),
      Center(child: Text("Buy"),),
      Center(child: Text("Wishlist"),),
      Center(child: Text("Account"),),
    ];
    return Scaffold(
      body: Obx(()=>pages[bottomController.currentIndex.value]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.redAccent,
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
          ),
          child: Obx(()=>BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: "Home"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: "Buy"
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart_fill),
                  label: "Wishlist"
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person),
                  label: "Account"
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: bottomController.currentIndex.value,
            onTap: bottomController.currentOntap,
            selectedItemColor: Colors.brown,
            elevation: 0.0,
          )),
        ),
      ),
    );
  }
}
