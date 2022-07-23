import 'package:cloath_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsItem extends StatelessWidget {
  ProductsItem({Key? key, required this.products,required this.index});

  ProductModel products;
  int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: GestureDetector(
        onTap: (){

        },
        child: GridTile(
            child: Container(
              height: size.height*0.28,
              width: size.width*0.46,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.1),
                    offset: Offset(0,3),
                    blurRadius: 7,
                    spreadRadius: 3,
                  )
                ]
              ),
                child: Stack(
                  children: [
                    Image.network(products.image,fit: BoxFit.cover,),
                    Positioned(
                      right: 0,
                        child: Obx(()=>IconButton(
                            onPressed: (){
                              products.isFavourite.toggle();
                            },
                            icon: products.isFavourite==false? Icon(CupertinoIcons.heart,color: Colors.redAccent,)
                            : Icon(CupertinoIcons.heart_fill,color: Colors.redAccent,),
                          ),
                        )
                    )
                  ],
                )
            ),
          footer: Container(
            height: 55,
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5,top: 5,right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width*0.35,
                        child: Text(products.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.robotoSlab(
                            color: Colors.white,
                          ),),
                      ),
                      Text("\u0024 "+products.price.toStringAsFixed(2),style: GoogleFonts.robotoSlab(
                        color: Colors.white
                      ),)
                    ],
                  ),
                  Text(products.rating.rate.toString(),style: GoogleFonts.robotoSlab(
                    color: Colors.orange
                  ),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
