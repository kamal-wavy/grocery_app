
import 'package:flutter/material.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/localDataBase/dbHelperModel.dart';
import 'package:testapp/localDataBase/localDbHelper.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            const Text('Favorite',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
            const SizedBox(height: 15,),
            const Divider(thickness: 1,),
            SizedBox(
              height: MediaQuery.of(context).size.height/1.27,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: favoruriteList.length,
                  itemBuilder: (context,index){
                return   Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                        child: ListTile(
                          leading:  SizedBox(
                              height: 55,width: 55,
                              child: Image(image: AssetImage(favoruriteList[index]["image"]))),
                          title: Text(favoruriteList[index]["name"],style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                          subtitle: Text(favoruriteList[index]["weight"],style: const TextStyle(fontSize: 14),),
                          trailing:  SizedBox(
                            width: 150,
                            child: Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('\$ ${favoruriteList[index]["rate"]}',style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                                const SizedBox(width: 8,),
                                const Icon(Icons.arrow_forward_ios,size: 20,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(thickness: 1,)
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25.0,right: 25,top: 20),
        child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(onPressed: () async {
              for(int i = 0; i<favoruriteList.length;i++){
                final cartData = DbModel(
                  name: favoruriteList[i]['name'],
                  weight: favoruriteList[i]['weight'],
                  image: favoruriteList[i]['image'],
                  rate: favoruriteList[i]['rate'],
                  fixRate: favoruriteList[i]['fixRate'],
                  noPieces: favoruriteList[i]['noPices'],
                );
                await dbHelper.insertMyCart(cartData);
              }
              ConstWidgetType.toast();
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder:
              //         (context) =>
              //     const LogInScreen()));
            },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ConstWidgetType.greenColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )
                )
            ), child: const Text('Add All To Cart',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
  List<Map<String,dynamic>> favoruriteList = ConstWidgetType.beveragesList;
}
