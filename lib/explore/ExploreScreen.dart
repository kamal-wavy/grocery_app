import 'package:flutter/material.dart';
import 'package:testapp/Filters/filterScreen.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/explore/exploreOpenItemScreen.dart';
import 'package:testapp/localDataBase/dbHelperModel.dart';
import 'package:testapp/localDataBase/localDbHelper.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<Map<String,dynamic>> productList = ConstWidgetType.findProductItemList;
  bool isSearch = false;
  final dbHelper = DatabaseHelper();
  List<Map<String,dynamic>> searchList = ConstWidgetType.searchEggList;
  @override
  TextEditingController searchController = TextEditingController();
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,left: 16,right: 16),
            child: Column(
              children: [
                const SizedBox(height: 14,),
                const Text('Find Products',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: isSearch? MediaQuery.of(context).size.width/1.27 : MediaQuery.of(context).size.width/1.1,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF2F3F2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextFormField(
                        onChanged: (text){
                          if(searchController.text.isNotEmpty){
                            setState(() {
                              isSearch = true;
                            });
                          }else{
                            setState(() {
                              isSearch = false;
                            });
                          }

                        },
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
                            hintText: "Search Store"),

                      ),
                    ),
                    const Spacer(),
                    isSearch ?
                        IconButton(onPressed: (){}, icon: const ImageIcon(AssetImage('assets/icons/menuIconImage.png'),size: 18,))
                        : const SizedBox(),
                  ],
                ),
                const SizedBox(height: 20,),
                isSearch? SizedBox(
                  height: MediaQuery.of(context).size.height/1.3,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      itemCount: searchList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 250,
                  ), itemBuilder: (BuildContext context,int index){
                    return fruitContainer(
                      searchList[index]['image'],searchList[index]['name'],searchList[index]['weight'],searchList[index]['rate'].toString(),searchList[index]['noPices'].toString(),searchList[index]['fixRate'].toString());
                  }),
                )
                    :SizedBox(
                  height: MediaQuery.of(context).size.height/1.3,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    itemCount: productList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                      mainAxisExtent: 220,
                  ), itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) =>
                             ExploreOpenItemScreen(
                               beveragesList: productList[index]['subCate'],
                               name: productList[index]['name'],
                             )));
                      },
                      child: Container(
                       // height: 220,
                        width: 180,
                        decoration: BoxDecoration(
                          color: productList[index]['colorRgb'],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: productList[index]['colorT'],width: 2)
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 100,
                              decoration:  BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      productList[index]['image']
                                  ),
                                ),
                              ),
                            ),
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0,right: 8),
                               child: Text(productList[index]['name'],textAlign: TextAlign.center,
                            maxLines: 3,
                            style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18),
                            ),
                             )
                          ],
                        ),
                      ),
                    );
                  },
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
  Padding fruitContainer(String imageText,String name,String weightText,String price,String noPieces,String fixRate) {
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
