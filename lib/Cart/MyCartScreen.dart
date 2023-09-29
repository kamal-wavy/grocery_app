
import 'package:flutter/material.dart';
import 'package:testapp/Cart/orderAcceptScreen.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/localDataBase/dbHelperModel.dart';
import 'package:testapp/localDataBase/localDbHelper.dart';
import 'package:testapp/tabBar/BottomBarScreen.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  int numberKg = 0;
  bool _isDelivery = false;
  bool _isPayment = false;
  bool _isPromoCode = false;
  bool _isTotalCost = false;
  bool isError = true;
  double totalPrice = 0;
  List<Map<String,dynamic>> cartList = ConstWidgetType.itemList;
  final dbHelper = DatabaseHelper();
  List<DbModel> data = [];
  getData() async {
    final datas = await dbHelper.getDataMyCart();
    setState(() {
      data = datas;
    });
    addBalance();
  }
  addBalance(){
    for (int i = 0; i < data.length; i++) {
      double price = data[i].rate;
      setState(() {
        double addPrice = totalPrice + price;
        String formattedTotalP = addPrice.toStringAsFixed(2);
        double doubleTotal = double.parse(formattedTotalP);
        totalPrice = doubleTotal;
      });
    }
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            const Text('My Cart',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
            const SizedBox(height: 25,),
            const Divider(thickness: 1,),
            const SizedBox(height: 10,),
            SizedBox(
              height: MediaQuery.of(context).size.height/1.27,
              width: MediaQuery.of(context).size.width,
              child:
              data.isNotEmpty ?
              ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context,index){
                return  Padding(
                  padding:  const EdgeInsets.only(left: 10.0,right: 10,),
                  child: Column(
                    children: [
                      ListTile(
                        leading:  SizedBox(height:60,width: 50,child: Image(image: AssetImage(data[index].image,//cartList[index]['image']
                        ))),
                        title:  Row(
                          children: [
                            Text(data[index].name,maxLines: 2,style: const TextStyle(
                                fontSize: 16,fontWeight: FontWeight.w600),),
                          const Spacer(),
                            SizedBox(height:30,width:30,child: IconButton(onPressed: () async {
                              final cartData = DbModel(
                                id: data[index].id,
                                noPieces: data[index].noPieces,
                                image: data[index].image,
                                fixRate: data[index].fixRate,
                                rate: data[index].rate,
                                weight: data[index].weight,
                                name: data[index].name
                              );
                              await dbHelper.deleteDataMyCart(cartData);
                             setState(() {
                               data.removeAt(index);
                             });
                            }, icon: const ImageIcon(AssetImage('assets/icons/deleteIconImage.png'),size: 20,))),

                          ],

                        ),

                        subtitle: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(data[index].weight,//cartList[index]['weight'],
                                   style: const TextStyle(fontSize: 14),),

                                Padding(
                                  padding: const EdgeInsets.only(top: 14.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(
                                              color: const Color(0xFFE2E2E2),width: 1,
                                            )
                                        ),
                                        child: IconButton(onPressed: () async {

                                            if(
                                            data[index].noPieces != 1){
                                              setState(() {
                                                data[index].noPieces --;
                                                double addPrice =
                                                    data[index].rate -
                                                        data[index].fixRate;
                                                String formattedValue = addPrice.toStringAsFixed(2);
                                                double doubleRate = double.parse(formattedValue);
                                                data[index].rate = doubleRate;
                                                double totalP = totalPrice - data[index].fixRate;
                                                String formattedTotalP = totalP.toStringAsFixed(2);
                                                double doubleTotal = double.parse(formattedTotalP);
                                                totalPrice = doubleTotal;
                                              });
                                              final cartData = DbModel(
                                                id: data[index].id,
                                                name: data[index].name,
                                                weight: data[index].weight,
                                                image: data[index].image,
                                                rate: data[index].rate,
                                                fixRate: data[index].fixRate,
                                                noPieces: data[index].noPieces,
                                              );
                                              await dbHelper.updateDataMyCart(cartData);
                                            }
                                            else{}

                                        }, icon: const ImageIcon(AssetImage('assets/icons/subtractIconImage.png'),size:20,color: Color(0xFFB3B3B3),),

                                        ),
                                      ),
                                      const SizedBox(width: 20,),
                                      Center(child: Text(data[index].noPieces.toString(),//cartList[index]['noPices'].toString(),
                                        style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xFF181725)),)),
                                      const SizedBox(width: 20,),
                                      Container(
                                        height: 40,width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(
                                              color: const Color(0xFFE2E2E2),width: 1,
                                            )
                                        ),
                                        child: IconButton(onPressed: ()async{
                                          setState(()  {
                                            data[index].noPieces ++;
                                           double addPrice =
                                                data[index].rate +
                                                    data[index].fixRate;
                                            String formattedValue = addPrice.toStringAsFixed(2);
                                            double doubleRate = double.parse(formattedValue);
                                            data[index].rate = doubleRate;
                                            double totalP = totalPrice + data[index].fixRate;
                                            String formattedTotalP = totalP.toStringAsFixed(2);
                                            double doubleTotal = double.parse(formattedTotalP);
                                                totalPrice = doubleTotal;
                                          });
                                            //double updateRate = data[index].rate;
                                            final cartData = DbModel(
                                              id: data[index].id,
                                              name: data[index].name,
                                              weight: data[index].weight,
                                              image: data[index].image,
                                              rate: data[index].rate,
                                              fixRate: data[index].fixRate,
                                              noPieces: data[index].noPieces,
                                            );
                                            await dbHelper.updateDataMyCart(cartData);

                                        }, icon:const ImageIcon(AssetImage('assets/icons/addIconImage.png'),size:20,color: Colors.green,),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Spacer(),
                            Text('\$${data[index].rate}',
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600
                            ),)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Divider(thickness: 1,)
                    ],
                  ),
                );
              }) : const Center(child: Text('No Item Available',
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),
              )),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25.0,right: 25,top: 20),
        child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
              myCartBottomSheet(context);
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
            ), child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 50,),
                const Spacer(),
                const Text('Go to Checkout',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
             const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xFF489E67),
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('\$$totalPrice'),
                )
              )
              ],
            ),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }

  Future<dynamic> myCartBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
              context: context,
              builder: (context) {
                return  SizedBox(
                  height: MediaQuery.of(context).size.height/1.7,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                       Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Checkout',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                            IconButton(onPressed: (){
                              Navigator.pop(context);
                            }, icon: const ImageIcon(AssetImage('assets/icons/deleteIconImage.png'),size: 16,))
                          ],
                        ),
                      ),
                      const Divider(thickness: 1,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16,),
                        child: Row(
                          children: [
                            const Text('Delivery',style: TextStyle(
                              color: Color(0xFF7C7C7C),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),),
                            const Spacer(),
                            const Text('Select Method',style: TextStyle(
                              fontWeight: FontWeight.w600,fontSize: 16
                            ),),
                            const SizedBox(height: 10,),
                            IconButton(onPressed: (){
                              setState(() {
                                _isDelivery = !_isDelivery;
                              });
                            }, icon:  ImageIcon(_isDelivery? const AssetImage('assets/icons/downIconImage.png'): const AssetImage('assets/icons/nextIconImage.png'),size: 14,))
                          ],
                        ),
                      ),
                      _isDelivery ?
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0,right: 16),
                        child: Text('Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                          style: TextStyle(fontSize: 13,color: Color(0xFF7C7C7C)),
                        ),
                      ):
                      const SizedBox(height: 1,width: 1,),
                      const Divider(thickness: 1,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16,),
                        child: Row(
                          children: [
                            const Text('Payment',style: TextStyle(
                              color: Color(0xFF7C7C7C),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),),
                            const Spacer(),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/atmLogoImage.png')
                                )
                              ),
                            ),
                            const SizedBox(height: 10,),
                            IconButton(onPressed: (){
                              setState(() {
                                _isPayment = !_isPayment;
                              });
                            }, icon:  ImageIcon(_isPayment? const AssetImage('assets/icons/downIconImage.png'): const AssetImage('assets/icons/nextIconImage.png'),size: 14,))
                          ],
                        ),
                      ),
                      _isPayment ?
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0,right: 16),
                        child: Text('Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                          style: TextStyle(fontSize: 13,color: Color(0xFF7C7C7C)),
                        ),
                      ):
                      const SizedBox(height: 1,width: 1,),
                      const Divider(thickness: 1,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16,),
                        child: Row(
                          children: [
                            const Text('Promo Code',style: TextStyle(
                              color: Color(0xFF7C7C7C),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),),
                            const Spacer(),
                            const Text('Pick discount',style: TextStyle(
                              fontSize: 16,fontWeight: FontWeight.w600
                            ),),
                            const SizedBox(height: 10,),
                            IconButton(onPressed: (){
                              setState(() {
                                _isPromoCode = !_isPromoCode;
                              });
                            }, icon:  ImageIcon(_isPromoCode? const AssetImage('assets/icons/downIconImage.png'): const AssetImage('assets/icons/nextIconImage.png'),size: 14,))
                          ],
                        ),
                      ),
                      _isPromoCode ?
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0,right: 16),
                        child: Text('Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                          style: TextStyle(fontSize: 13,color: Color(0xFF7C7C7C)),
                        ),
                      ):
                      const SizedBox(height: 1,width: 1,),
                      const Divider(thickness: 1,),
                       Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16,),
                        child: Row(
                          children: [
                            const Text('Total Cost',style: TextStyle(
                              color: Color(0xFF7C7C7C),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),),
                            const Spacer(),
                             Text('\$$totalPrice',style: const TextStyle(
                              fontSize: 16,fontWeight: FontWeight.w600
                            ),),
                            const SizedBox(height: 10,),
                            IconButton(onPressed: (){
                              setState(() {
                                _isTotalCost = !_isTotalCost;
                              });
                            }, icon:  ImageIcon(_isTotalCost? const AssetImage('assets/icons/downIconImage.png'): const AssetImage('assets/icons/nextIconImage.png'),size: 14,))
                          ],
                        ),
                      ),
                      _isTotalCost ?
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0,right: 16),
                        child: Text('Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                          style: TextStyle(fontSize: 13,color: Color(0xFF7C7C7C)),
                        ),
                      ):
                      const SizedBox(height: 1,width: 1,),
                      const Divider(thickness: 1,),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0,right: 16),
                        child: Text('By placing an order you agree to our',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF7C7C7C),
                          fontSize: 14
                        ),),
                      ) ,
                      const SizedBox(height: 2,),
                       Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16),
                        child: Row(
                          children: [
                            InkWell(
                              onTap:(){},
                              child: const Text('Terms',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16
                              ),),
                            ),
                            const Text(' And ',style: TextStyle(
                              fontWeight: FontWeight.w600,
                                color: Color(0xFF7C7C7C),
                              fontSize: 14
                            ),), InkWell(
                              onTap: (){},
                              child: const Text('Conditions',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16
                              ),),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25,top: 20),
                        child: SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: ElevatedButton(onPressed: () async {
                              for(int i = 0; i<data.length;i++){
                                final cartData = DbModel(
                                  name: data[i].name,
                                  weight: data[i].weight,
                                  image: data[i].image,
                                  rate: data[i].rate,
                                  fixRate: data[i].fixRate,
                                  noPieces: data[i].noPieces,
                                );
                                await dbHelper.insertOrderHistory(cartData);
                              }
                              if(isError != false){
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder:
                                        (context) =>
                                    const OrderAcceptScreen()));
                              }
                              else{
                                dialogBoxContainer(context);
                              }
                            },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ConstWidgetType.greenColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )
                                )
                            ), child: const Text('Place Order',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                            )),
                      ),
                      const SizedBox(height: 20,)

                    ],
                  ),
                );
              },
            );
  }
  dialogBoxContainer(context){
   return showDialog(context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.only(left: 25.0,right: 25,top: 100,bottom: 100),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 25,),
               Row(
                children: [
                  const SizedBox(width: 20,),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const ImageIcon(AssetImage('assets/icons/deleteIconImage.png'),size: 18,)),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 40,),
              const SizedBox(
                  height: 230,
                  width: 230,
                  child: Image(image: AssetImage(('assets/icons/errorIcon.png')))),
              const SizedBox(height: 50,),
              const Text('Oops! Order Failed',style: TextStyle(
                fontSize: 28,fontWeight: FontWeight.w600,
              ),
              ),
              const SizedBox(height: 20,),
               const Text('Something went temblor wrong.',style: TextStyle(
                fontSize: 16,fontWeight: FontWeight.w600,
                 color: Color(0xFF7C7C7C)
              ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25,top: 20),
                child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
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
                    ), child: const Text('Track Order',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                    )),
              ),
             const SizedBox(height: 30,),
             GestureDetector( onTap:(){},
                 child: const Text('Back to home',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),)),
           const SizedBox(height: 25,),
            ],
          ),
        ),
      );
    });
  }
}
