import 'package:cloath_app/view-model/controller.dart';
import 'package:cloath_app/view/products_item.dart';
import 'package:cloath_app/widget/category_chip_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Explore"),
                Text("Trendy Cloths"),

              ],
            ),
            Container(
              height: size.height*0.055,
              width: size.height*0.055,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://avatars.githubusercontent.com/u/44537702?v=4")
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        offset: const Offset(0, 3),
                        blurRadius: 4,
                        spreadRadius: 1
                    )
                  ]
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.8,
                  padding: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue.withOpacity(0.2),
                            offset: Offset(0, 3),
                            blurRadius: 4,
                            spreadRadius: 1)
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(CupertinoIcons.search),
                        hintText: "Search",
                        hintStyle: GoogleFonts.robotoSlab(color: Colors.grey)),
                  ),
                ),
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.13,
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue.withOpacity(0.2),
                            offset: const Offset(0, 3),
                            blurRadius: 4,
                            spreadRadius: 1)
                      ]),
                  child: const Icon(
                    CupertinoIcons.list_dash,
                    size: 30,
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 8, bottom: 10),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: chipList,
              ),
            ),
            Obx(()=> Expanded(
                child: productsController.isLoading == true
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: productsController.productsList.length,
                    itemBuilder: (context, index){
                      return ProductsItem(products: productsController.productsList[index],index: index,);
                    }
                )
            ),
            )
          ],
        ),
      ),
    );
  }
}
