import 'package:flutter/material.dart';
import 'package:testapp/localDataBase/localDbHelper.dart';
import 'package:testapp/tabBar/BottomBarScreen.dart';

import '../localDataBase/dbHelperModel.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final dbHelper = DatabaseHelper();
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  List<DbModel> data = [];
  getData() async {
    final datas = await dbHelper.getDataOrderHistory();
    setState(() {
      data = datas;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10,),
             Row(
              children: [
                const SizedBox(width: 8,),
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const ImageIcon(AssetImage('assets/icons/backIconIos.png'),size: 18,)),
             const Spacer(),
             const Text('Order History',style: TextStyle(
               fontWeight: FontWeight.w600,fontSize: 22
             ),),
             const Spacer(),
                const SizedBox(width: 48,)
              ],
            ),
            //SizedBox(height: 10,),
            SizedBox(
              height: MediaQuery.of(context).size.height/1.11,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0,bottom: 8,right: 16,left: 16),
                  child: Container(
                    height: MediaQuery.of(context).size.width/2.2,
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black12,width: 1)
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 16,),
                            SizedBox(
                              height: MediaQuery.of(context).size.width/4,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child:  Image(image: AssetImage(data[index].image),),
                            ),
                            const SizedBox(width: 30,),
                              SizedBox(
                                height: MediaQuery.of(context).size.width/3,
                                child:  Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(height: 10,),
                                  Text(data[index].name,style: const TextStyle(
                                    fontSize: 22,fontWeight: FontWeight.w600
                                  ),),
                                  //Spacer(),
                                  Text('\$${data[index].rate}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18
                                  ),
                                  ),
                                  const SizedBox(height: 10,),
                                ],
                            ),
                              )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Container(
                              height: 30,
                              child: InkWell(
                                onTap: () async {
                                  final cartData = DbModel(
                                      id: data[index].id,
                                      noPieces: data[index].noPieces,
                                      image: data[index].image,
                                      fixRate: data[index].fixRate,
                                      rate: data[index].rate,
                                      weight: data[index].weight,
                                      name: data[index].name
                                  );
                                  await dbHelper.deleteDataOrderHistory(cartData);
                                  setState(() {
                                    data.removeAt(index);
                                  });
                                },
                                child: const Row(
                                  children: [
                                    ImageIcon(AssetImage('assets/icons/deleteIconImage.png'),size: 16,),
                                    SizedBox(width: 10,),
                                    Text('CANCEL',style: TextStyle(fontSize: 18),)
                                  ],
                                ),
                              ),
                            ), Container(
                              height: 30,
                              child: const Row(
                                children: [
                                  ImageIcon(AssetImage('assets/icons/locationIcon.png'),size: 20),
                                  SizedBox(width: 10,),
                                  Text('TRACK',style: TextStyle(fontSize: 18),)
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      )
    );
  }
}
