import 'package:dots_indicator/dots_indicator.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/localDataBase/dbHelperModel.dart';
import 'package:testapp/localDataBase/localDbHelper.dart';

import 'homeItemOpenScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  Color greenColor = ConstWidgetType.greenColor;
  int _currentPosition = 0;
  List<Map<String,dynamic>> exclusiveItem = ConstWidgetType.itemList;
  List<Map<String,dynamic>> bestSellingItem = ConstWidgetType.itemListSec;
  List<Map<String,dynamic>>
  groceriesItem = ConstWidgetType.chickenItem;
  final dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16),
              child: Column(
                children: [
                 const SizedBox(height: 20,),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/carretImage.png')
                      )
                    ),
                  ),
                 const SizedBox(height: 20,),
                  const Row(
                    children: [
                      Spacer(),
                      Icon(Icons.location_on_rounded,color: Color(0xFF4C4F4D),size: 20,),
                      Text('Dhaka, Banassre',style: TextStyle(
                        fontSize: 18,color: Color(0xFF4C4F4D)
                      ),),
                      Spacer(),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                     color: const Color(0xFFF2F3F2),
                     borderRadius: BorderRadius.circular(10)
                   ),
                    child: Center(
                      child: TextFormField(
                        controller: searchController,
                        decoration:  InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),

                            ),
                          prefixIcon: const Icon(Icons.search_rounded),
                            //border: InputBorder.none,
                            focusedBorder: InputBorder.none,

                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Search items"),

                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Stack(
                    children: [
                      ExpandablePageView(
                        onPageChanged: (index){
                          setState(() {
                            _currentPosition = index;
                          });
                        },
                        children: [
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(4)
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left:10,
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/icons/vegetableImage.png')
                                        )
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right:0,
                                  bottom:0,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/icons/leaf.png')
                                        )
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right:3,
                                  top:-10,
                                  child: Container(
                                    height: 60,
                                    width: 100,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/icons/vegetablesCuttingImage.png')
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.blue,
                          ),Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            color: greenColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 100,),
                          Align(alignment: Alignment.bottomCenter, child:  DotsIndicator(
                            dotsCount: 3,
                            position: _currentPosition,
                            decorator: DotsDecorator(
                              color: Colors.black12, // Inactive color
                              activeColor: greenColor,
                              size: const Size.square(9.0),
                              activeSize: const Size(25.0, 9.0),
                              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Exclusive Offer',style: TextStyle(
                        fontWeight: FontWeight.w600,fontSize: 24
                      ),),
                      const Spacer(),
                      Text('See all',style: TextStyle(
                        fontSize: 16,color: greenColor
                      ),)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: exclusiveItem.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,int i){
                        return fruitContainer(exclusiveItem[i]['image'],exclusiveItem[i]['name'],exclusiveItem[i]['weight'],exclusiveItem[i]['rate'].toString(),
                            (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeItemOpenScreen(
                              image: exclusiveItem[i]['image'],name: exclusiveItem[i]['name'],
                              weight: exclusiveItem[i]['weight'],noPieces: exclusiveItem[i]['noPices'],
                              rate: exclusiveItem[i]['rate'],fixRate: exclusiveItem[i]['fixRate'],
                            )));},
                          exclusiveItem[i]['fixRate'].toString()
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Best Selling',style: TextStyle(
                        fontWeight: FontWeight.w600,fontSize: 24
                      ),),
                      const Spacer(),
                      Text('See all',style: TextStyle(
                        fontSize: 16,color:greenColor
                      ),)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: bestSellingItem.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,int i){
                        return fruitContainer(bestSellingItem[i]['image'],bestSellingItem[i]['name'],bestSellingItem[i]['weight'],bestSellingItem[i]['rate'].toString(),(){ Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeItemOpenScreen(
                          image: bestSellingItem[i]['image'],name: bestSellingItem[i]['name'],
                          weight: bestSellingItem[i]['weight'],noPieces: bestSellingItem[i]['noPices'],
                          rate: bestSellingItem[i]['rate'],fixRate: exclusiveItem[i]['fixRate'],
                        )));},bestSellingItem[i]['fixRate'].toString());
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Groceries',style: TextStyle(
                        fontWeight: FontWeight.w600,fontSize: 24
                      ),),
                      const Spacer(),
                      Text('See all',style: TextStyle(
                        fontSize: 16,color:greenColor
                      ),)
                    ],
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: groceriesItem.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,int i){
                        return Padding(
                          padding:  const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: groceriesItem[i]['colorT'],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Wrap(
                              children: [
                                Chip(
                                    backgroundColor: groceriesItem[i]['colorT'],
                                    avatar: Container(
                                      height: 70,
                                      width: 70,
                                      decoration:  BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(groceriesItem[i]['image'])
                                          )
                                      ),
                                    ),
                                    label: Padding(
                                      padding: const EdgeInsets.only(right: 30.0),
                                      child: SizedBox(
                                          height: 90,
                                          child: Center(child: Text(groceriesItem[i]['name'].toString(),
                                              style: const TextStyle(
                                                          fontSize: 20,fontWeight: FontWeight.w600
                                                        ),
                                          ))),
                                    ))
                              ],
                            ),
                          )
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: groceriesItem.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,int i){
                        return fruitContainer(groceriesItem[i]['image'],groceriesItem[i]['name'],groceriesItem[i]['weight'],groceriesItem[i]['rate'].toString(),(){ Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeItemOpenScreen(
                          image: groceriesItem[i]['image'],name: groceriesItem[i]['name'],
                          weight: groceriesItem[i]['weight'],noPieces: groceriesItem[i]['noPices'],
                          rate: groceriesItem[i]['rate'],fixRate: exclusiveItem[i]['fixRate'],
                        )));},groceriesItem[i]['fixRate'].toString());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   fruitContainer(String imageText,String name,String weightText,String price,VoidCallback onTap,String fixRate) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                           // height: 210,
                            width: 150,
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
                                        height: 60,
                                        width: 100,
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
                                        Text('\$$price',style: const TextStyle(
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
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            color:  greenColor
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
                        ),
    );
  }
}
