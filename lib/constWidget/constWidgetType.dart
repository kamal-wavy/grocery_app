import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testapp/localDataBase/dbHelperModel.dart';
import 'package:testapp/localDataBase/localDbHelper.dart';

class ConstWidgetType{
  static final dbHelper =  DatabaseHelper();
  static  Color greenColor = const Color(0xFF53B175);
  static List<Map<String,dynamic>> itemList = [{'name':'Coke Can','weight':'325 ml,Price','rate':15.5,'image':'assets/icons/cokeImage.png','noPices':1,'fixRate':15.5},
    {'name':'Leaf','weight':'0.5 Kg,Price','rate':15.5,'image':'assets/icons/leaf.png','noPices':1,'fixRate':15.5},
    {'name':'Chicken','weight':'1 Kg,Price','rate':20.5,'image':'assets/icons/chickenImage.png','noPices':1,'fixRate':20.5},
    {'name':'Naturel Red Apple','weight':'1 Kg,Price','rate':5.5,'image':'assets/icons/appleImage.png','noPices':1,'fixRate':5.5},
    {'name':'Banana','weight':'1 Kg,Price','rate':4.5,'image':'assets/icons/bananaImage.png','noPices':1,'fixRate':4.5},
    {'name':'Chicken','weight':'1 Kg,Price','rate':20.5,'image':'assets/icons/chickenImage.png','noPices':1,'fixRate':20.5},
    {'name':'Naturel Red Apple','weight':'1 Kg,Price','rate':5.5,'image':'assets/icons/appleImage.png','noPices':1,'fixRate':5.5},
    {'name':'Banana','weight':'1 Kg,Price','rate':4.5,'image':'assets/icons/bananaImage.png','noPices':1,'fixRate':4.5},
    {'name':'Leaf','weight':'0.5 Kg,Price','rate':15.5,'image':'assets/icons/leaf.png','noPices':1,'fixRate':15.5},

  ];
  static List<Map<String,dynamic>> itemListSec = [
    {'name':'Leaf','weight':'0.5 Kg,Price','rate':15.5,'image':'assets/icons/leaf.png','noPices':1,'fixRate':15.5},
    {'name':'Banana','weight':'1 Kg,Price','rate':4.5,'image':'assets/icons/bananaImage.png','noPices':1,'fixRate':4.5},
    {'name':'Naturel Red Apple','weight':'1 Kg,Price','rate':5.5,'image':'assets/icons/appleImage.png','noPices':1,'fixRate':5.5},
    {'name':'Chicken','weight':'1 Kg,Price','rate':20.5,'image':'assets/icons/chickenImage.png','noPices':1,'fixRate':20.5},
    {'name':'Banana','weight':'1 Kg,Price','rate':4.5,'image':'assets/icons/bananaImage.png','noPices':1,'fixRate':4.5},
    {'name':'Chicken','weight':'1 Kg,Price','rate':20.5,'image':'assets/icons/chickenImage.png','noPices':1,'fixRate':25.5},
    {'name':'Leaf','weight':'0.5 Kg,Price','rate':15.5,'image':'assets/icons/leaf.png','noPices':1,'fixRate':15.5},
    {'name':'Coke Can','weight':'325 ml,Price','rate':15.5,'image':'assets/icons/cokeImage.png','noPices':1,'fixRate':15.5},
    {'name':'Naturel Red Apple','weight':'1 Kg,Price','rate':5.5,'image':'assets/icons/appleImage.png','noPices':1,'fixRate':5.5},
  ];
  static List<Map<String,dynamic>> chickenItem = [
    {'name':'Meat and Fish','weight':'1 Kg,Price','rate':5.5,'image':'assets/icons/meatAndFishImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'fixRate':5.5},
    {'name':'Chicken','weight':'1 Kg,Price','rate':20.5,'image':'assets/icons/chickenImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'fixRate':20.5},
    {'name':'Leaf','weight':'0.5 Kg,Price','rate':15.5,'image':'assets/icons/leaf.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'fixRate':15.5},
    {'name':'Banana','weight':'1 Kg,Price','rate':4.5,'image':'assets/icons/bananaImage.png','noPices':1,'colorT': const Color(0xFF53B175),'fixRate':4.5},
    {'name':'Naturel Red Apple','weight':'1 Kg,Price','rate':5.5,'image':'assets/icons/appleImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'fixRate':5.5},
    {'name':'Chicken','weight':'1 Kg,Price','rate':20.5,'image':'assets/icons/chickenImage.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'fixRate':20.5},
    {'name':'Banana','weight':'1 Kg,Price','rate':4.5,'image':'assets/icons/bananaImage.png','noPices':1,'colorT': const Color(0xFF53B175),'fixRate':4.5},
    {'name':'Chicken','weight':'1 Kg,Price','rate':20.5,'image':'assets/icons/chickenImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'fixRate':20.5},
    {'name':'Leaf','weight':'0.5 Kg,Price','rate':15.5,'image':'assets/icons/leaf.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'fixRate':15.5},
    {'name':'Coke Can','weight':'325 ml,Price','rate':15.5,'image':'assets/icons/cokeImage.png','noPices':1,'colorT': const Color(0xFF53B175),'fixRate':15.5},
    {'name':'Naturel Red Apple','weight':'1 Kg,Price','rate':5.5,'image':'assets/icons/appleImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'fixRate':5.5},
    {'name':'Meat and Fish','weight':'1 Kg,Price','rate':5.5,'image':'assets/icons/meatAndFishImage.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'fixRate':5.5},
    {'name':'Fresh Fruits','weight':'1 Kg,Price','rate':5.5,'image':'assets/icons/freshFruitImage.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'fixRate':5.5},
  ];
  static List<Map<String,dynamic>> findProductItemList = [
    {'name':'Fresh Fruits & Vegetable',
      'subCate': [
        {'name':'Banana','weight':'1 Kg,Price','rate':4.5,'image':'assets/icons/bananaImage.png','noPices':1,'colorT': const Color(0xFF53B175),'fixRate':4.5},
        {'name':'Naturel Red Apple','weight':'1 Kg,Price','rate':5.5,'image':'assets/icons/appleImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'fixRate':5.5},
        {'name':'Fresh Fruits','weight':'1 Kg,Price','rate':5.5,'image':'assets/icons/freshFruitImage.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'fixRate':5.5},
        {'name':'Banana','weight':'1 Kg,Price','rate':4.5,'image':'assets/icons/bananaImage.png','noPices':1,'colorT': const Color(0xFF53B175),'fixRate':4.5},

      ],
      'weight':'1 Kg,Price','rate':5.5,'image':'assets/icons/freshFruitImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1)},
    {'name':'Beverages',
      'subCate': [
        {'name':'Diet Coke','weight':'355 ml,Price','rate':1.9,'image':'assets/icons/cokeImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1),'fixRate':4.5},
        {'name':'Sprite Can','weight':'355 ml,Price','rate':7.5,'image':'assets/icons/spriteImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Orange Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/orangeJuiceImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Apple & Grape Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/appleJuice.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'colorRgb': const Color.fromRGBO(215, 59, 119, 0.15),'fixRate':4.5},

      ],
      'weight':'1/Liter/Price','rate':7.5,'image':'assets/icons/softDrinkImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1)},
    {'name':'Meat & Fish',
      'subCate': [
        {'name':'Diet Coke','weight':'355 ml,Price','rate':1.9,'image':'assets/icons/cokeImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1),'fixRate':4.5},
        {'name':'Sprite Can','weight':'355 ml,Price','rate':7.5,'image':'assets/icons/spriteImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Orange Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/orangeJuiceImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Apple & Grape Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/appleJuice.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'colorRgb': const Color.fromRGBO(215, 59, 119, 0.15),'fixRate':4.5},
      ],
      'weight':'1 kg,Price','rate':9.2,'image':'assets/icons/meatAndFishImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1)},
    {'name':'Bakery & Snacks',
      'subCate': [    {'name':'Diet Coke','weight':'355 ml,Price','rate':1.9,'image':'assets/icons/cokeImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1),'fixRate':4.5},
        {'name':'Sprite Can','weight':'355 ml,Price','rate':7.5,'image':'assets/icons/spriteImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Orange Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/orangeJuiceImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Apple & Grape Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/appleJuice.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'colorRgb': const Color.fromRGBO(215, 59, 119, 0.15),'fixRate':4.5},

      ],
      'weight':'1 kg,Price','rate':19.52,'image':'assets/icons/snacksImage.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'colorRgb': const Color.fromRGBO(215, 59, 119, 0.15)},
    {'name':'Fresh Fruits & Vegetable',
      'subCate': [    {'name':'Diet Coke','weight':'355 ml,Price','rate':1.9,'image':'assets/icons/cokeImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1),'fixRate':4.5},
        {'name':'Sprite Can','weight':'355 ml,Price','rate':7.5,'image':'assets/icons/spriteImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Orange Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/orangeJuiceImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Apple & Grape Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/appleJuice.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'colorRgb': const Color.fromRGBO(215, 59, 119, 0.15),'fixRate':4.5},

      ],
      'weight':'1 Kg,Price','rate':5.5,'image':'assets/icons/freshFruitImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1)},
    {'name':'Cooking Oil & Ghee',
      'subCate': [    {'name':'Diet Coke','weight':'355 ml,Price','rate':1.9,'image':'assets/icons/cokeImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1),'fixRate':4.5},
        {'name':'Sprite Can','weight':'355 ml,Price','rate':7.5,'image':'assets/icons/spriteImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Orange Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/orangeJuiceImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Apple & Grape Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/appleJuice.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'colorRgb': const Color.fromRGBO(215, 59, 119, 0.15),'fixRate':4.5},

      ],
      'weight':'1/Liter/Price','rate':7.5,'image':'assets/icons/oilImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1)},
    {'name':'Meat & Fish',
      'subCate': [   {'name':'Diet Coke','weight':'355 ml,Price','rate':1.9,'image':'assets/icons/cokeImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1),'fixRate':4.5},
        {'name':'Sprite Can','weight':'355 ml,Price','rate':7.5,'image':'assets/icons/spriteImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Orange Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/orangeJuiceImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Apple & Grape Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/appleJuice.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'colorRgb': const Color.fromRGBO(215, 59, 119, 0.15),'fixRate':4.5},

      ],
      'weight':'1 kg,Price','rate':9.2,'image':'assets/icons/meatAndFishImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1)},
    {'name':'Bakery & Snacks',
      'subCate': [    {'name':'Diet Coke','weight':'355 ml,Price','rate':1.9,'image':'assets/icons/cokeImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1),'fixRate':4.5},
        {'name':'Sprite Can','weight':'355 ml,Price','rate':7.5,'image':'assets/icons/spriteImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Orange Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/orangeJuiceImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':5.5},
        {'name':'Apple & Grape Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/appleJuice.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'colorRgb': const Color.fromRGBO(215, 59, 119, 0.15),'fixRate':4.5},

      ],
      'weight':'1 kg,Price','rate':19.52,'image':'assets/icons/snacksImage.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'colorRgb': const Color.fromRGBO(215, 59, 119, 0.15)},

  ];
  static List<Map<String,dynamic>> beveragesList = [
    {'name':'Diet Coke','weight':'355 ml,Price','rate':1.9,'image':'assets/icons/cokeImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1),'fixRate':1.9},
    {'name':'Sprite Can','weight':'355 ml,Price','rate':7.5,'image':'assets/icons/spriteImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':7.5},
    {'name':'Orange Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/orangeJuiceImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':15.99},
    {'name':'Apple & Grape Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/appleJuice.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'colorRgb': const Color.fromRGBO(215, 59, 119, 0.15),'fixRate':15.99},
    {'name':'Diet Coke','weight':'355 ml,Price','rate':1.9,'image':'assets/icons/cokeImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1),'fixRate':1.9},
    {'name':'Sprite Can','weight':'355 ml,Price','rate':7.5,'image':'assets/icons/spriteImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':7.5},
    {'name':'Orange Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/orangeJuiceImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':15.99},
    {'name':'Apple & Grape Juice','weight':'2L,Price','rate':15.99,'image':'assets/icons/appleJuice.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'colorRgb': const Color.fromRGBO(215, 59, 119, 0.15),'fixRate':15.99},

  ];
  static List<Map<String,dynamic>> searchEggList = [
    {'name':'Egg Chicken Red','weight':'4pcs, Price','rate':1.9,'image':'assets/images/eggBasketImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1),'fixRate':1.9},
    {'name':'Egg Chicken White','weight':'180g, Price','rate':7.5,'image':'assets/images/whiteEggImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':7.5},
    {'name':'Egg Pasta ','weight':'30gm, Price','rate':15.99,'image':'assets/images/eggPastaImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':15.99},
    {'name':'Egg Noodles','weight':'2L, Price','rate':15.99,'image':'assets/images/eggNoodlesImage.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'colorRgb': const Color.fromRGBO(215, 59, 119, 0.15),'fixRate':15.99},
    {'name':'Mayonnais Eggless','weight':'250g,Price','rate':1.9,'image':'assets/images/butterImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1),'fixRate':1.9},
    {'name':'Egg Noodles','weight':'50g,Price','rate':7.5,'image':'assets/images/roundedNoodlesImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':7.5},
    {'name':'Egg Chicken Red','weight':'4pcs, Price','rate':1.9,'image':'assets/images/eggBasketImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1),'fixRate':1.9},
    {'name':'Egg Chicken White','weight':'180g, Price','rate':7.5,'image':'assets/images/whiteEggImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':7.5},
    {'name':'Egg Pasta ','weight':'30gm, Price','rate':15.99,'image':'assets/images/eggPastaImage.png','noPices':1,'colorT': const Color(0xFFFDE598),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':15.99},
    {'name':'Egg Noodles','weight':'2L, Price','rate':15.99,'image':'assets/images/eggNoodlesImage.png','noPices':1,'colorT': const Color(0xFFD3B0E0),'colorRgb': const Color.fromRGBO(215, 59, 119, 0.15),'fixRate':15.99},
    {'name':'Mayonnais Eggless','weight':'250g,Price','rate':1.9,'image':'assets/images/butterImage.png','noPices':1,'colorT': const Color(0xFF53B175),'colorRgb': const Color.fromRGBO(83, 177, 117, 0.1),'fixRate':7.5},
    {'name':'Egg Noodles','weight':'50g,Price','rate':7.5,'image':'assets/images/roundedNoodlesImage.png','noPices':1,'colorT': const Color(0xFFF8A44C),'colorRgb': const Color.fromRGBO(248, 164, 76, 0.1),'fixRate':1.9},


  ];
  static backGroundImage(context){
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/4.1,
              width: MediaQuery.of(context).size.width,
              child: const Image(image: AssetImage(
                  'assets/images/backGroundImage.png'
              ),fit: BoxFit.fill,),
            ),
            // Spacer(),
            Container(
              height: MediaQuery.of(context).size.height/4.1,
              width: MediaQuery.of(context).size.width,
              child: const Image(image: AssetImage(
                  'assets/images/backGroundImage2.png'
              ),fit: BoxFit.fill,),
            ),
          ],
        ),
      ),
    );
  }
  static toast(){
    return    Fluttertoast.showToast(
      msg: 'Item add to My cart',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static fruitContainer(context,String imageText,String name,String weightText,String price,String noPieces,String fixRate) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(

        width: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black12,width: 2)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Row(
                children: [
                  const Spacer(),
                  Container(
                    height: 90,
                    width: 90,
                    decoration:  BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imageText)
                        )
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 20,),
              Text(name,
                maxLines: 2,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),),
              const SizedBox(height: 5,),
              Text(weightText,style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7C7C7C)
              ),),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Text(
                    '\$$price',style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                  const Spacer(),
                  InkWell(
                    onTap: ()  async {
                      double rate = double.parse(price);
                      double fixRates = double.parse(fixRate);
                      final cartData = DbModel(
                        name: name,
                        weight: weightText,
                        image: imageText,
                        rate: rate,
                        fixRate: fixRates,
                        noPieces: 1,
                      );
                      await dbHelper.insertMyCart(cartData);
                      ConstWidgetType.toast();
                      Navigator.pop(context);

                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color:  ConstWidgetType.greenColor
                      ),
                      child: const Icon(Icons.add,color: Colors.white,size: 25,),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}
