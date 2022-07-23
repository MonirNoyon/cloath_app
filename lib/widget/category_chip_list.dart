import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

List _chipItem = ["All", "Men", "Women", "Electronics"].obs;

var selectIndex = 0.obs;

List<Widget> chipList = List.generate(_chipItem.length, (index) {
  return Container(
    margin: const EdgeInsets.only(right: 12),
    child: Obx(
      () => index == 0
          ? ChoiceChip(
              label: Text(_chipItem[index]),
              backgroundColor: Colors.white,
              selectedColor: Colors.brown,
              elevation: 5,
              selected: selectIndex == index,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              labelStyle: GoogleFonts.robotoSlab(
                  color: selectIndex == index ? Colors.white : Colors.grey),
              shadowColor: Colors.blue.withOpacity(0.8),
              onSelected: (value) {
                selectIndex.value = index;
              },
            )
          : ChoiceChip(
              label: Text(_chipItem[index]),
              backgroundColor: Colors.white,
              selectedColor: Colors.brown,
              elevation: 5,
              selected: selectIndex == index,
              avatar: Icon(
                Icons.chair,
                color: selectIndex == index ? Colors.white : Colors.grey,
                size: 20,
              ),
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              labelStyle: GoogleFonts.robotoSlab(
                  color: selectIndex == index ? Colors.white : Colors.grey),
              shadowColor: Colors.blue.withOpacity(0.8),
              onSelected: (value) {
                selectIndex.value = index;
              },
            ),
    ),
  );
});
