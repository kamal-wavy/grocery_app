import 'package:dots_indicator/dots_indicator.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/localDataBase/dbHelperModel.dart';
import 'package:testapp/localDataBase/localDbHelper.dart';

class HomeItemOpenScreen extends StatefulWidget {
  String image = '';
  String name = '';
  String weight = '';
  double rate = 0;
  int noPieces = 0;
  double fixRate = 0;
 // List<Map<String,dyanamic>> listT = []


  HomeItemOpenScreen({super.key, required this.image,required this.name,required this.weight,required this.rate,required this.noPieces,required this.fixRate});


  @override
  State<HomeItemOpenScreen> createState() => _HomeItemOpenScreenState();
}

class _HomeItemOpenScreenState extends State<HomeItemOpenScreen> {
  @override
  int _currentPosition = 0;
  int numberKg = 1;
  bool isProductDeOn = false;
  bool isNutritionsDeOn = false;
  bool isReViewDeOn = false;
  final dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xFFF2F3F2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: const ImageIcon(AssetImage('assets/icons/backIconIos.png'),size: 18,)),
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Container(
                      height: 20,
                      width: 20,
                      decoration:  const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/icons/logOutImage.png'
                                  //'assets/icons/logOutImage.png'
                              )
                          )
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                ),
                child: Stack(
                  children: [

                    ExpandablePageView(
                      onPageChanged: (index){
                        setState(() {
                          _currentPosition = index;
                        });
                      },
                      children: [
                        SizedBox(
                            height: 200,width:350,
                            child: Image(image: AssetImage(widget.image))),
                        SizedBox(
                            height: 200,width:350,
                            child: Image(image: AssetImage(widget.image))),
                        SizedBox(
                            height: 200,width:350,
                            child: Image(image: AssetImage(widget.image))),
                      ],
                    ),
                    Positioned(
                      bottom: 20,
                      left: MediaQuery.of(context).size.width/2.6,
                      child: DotsIndicator(
                        dotsCount: 3,
                        position: _currentPosition,
                        decorator: DotsDecorator(
                          color: Colors.black12, // Inactive color
                          activeColor: ConstWidgetType.greenColor,
                          size: const Size.square(5.0),
                          activeSize: const Size(30.0, 5.0),
                          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
               SizedBox(
                 height: MediaQuery.of(context).size.height/1.73,
                 child: ListView(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 16.0,right: 16,top: 8),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                            Text(widget.name,style: const TextStyle(
                               fontSize: 24,fontWeight: FontWeight.w600
                           ),),
                           IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,size: 30,color: Colors.black38,))
                         ],
                       ),
                     ),
                      Padding(
                       padding: const EdgeInsets.only(left: 16,right: 16),
                       child: Text(widget.weight,style: const TextStyle(color: Color(0xFF7C7C7C),
                         fontWeight: FontWeight.w600,fontSize: 16,
                       ),),
                     ),
                     SizedBox(height: 16,),
                     Padding(
                       padding: const EdgeInsets.only(left: 4.0,top: 8,right: 30),
                       child: Row(
                         children: [
                           IconButton(onPressed: (){
                             setState(() {
                               if(widget.noPieces != 1){
                                 setState(() {
                                   widget.noPieces--;
                                   widget.rate = widget.rate + widget.fixRate;
                                 });

                               }
                               else{}
                             });
                           }, icon: const ImageIcon(AssetImage('assets/icons/subtractIconImage.png'),size:20,color: Color(0xFFB3B3B3),),

                           ),
                           const SizedBox(width: 10,),
                           Container(height: 40,width: 40,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(13),
                                 border: Border.all(
                                   color: const Color(0xFFE2E2E2),width: 1,
                                 )
                             ),
                             child: Center(child: Text(widget.noPieces.toString(),style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xFF181725)),)),
                           ),
                           const SizedBox(width: 10,),
                           IconButton(onPressed: (){
                             setState(() {
                               widget.noPieces++;
                               widget.rate = widget.rate + widget.fixRate;

                             });
                           }, icon:const ImageIcon(AssetImage('assets/icons/addIconImage.png'),size:20,color: Colors.green,),
                           ),
                           const Spacer(),
                            Text('\$${widget.rate}',style: const TextStyle(
                               fontSize: 24,
                               fontWeight: FontWeight.w600
                           ),)
                         ],
                       ),
                     ),
                     SizedBox(height: 16,),
                     const Padding(
                       padding: EdgeInsets.only(left: 16.0,right: 16),
                       child: Divider(thickness: 1,),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 16.0,right: 16,),
                       child: Row(
                         children: [
                           const Text('Product Detail',style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                           ),),
                           const Spacer(),
                           IconButton(onPressed: (){
                             setState(() {
                               isProductDeOn = !isProductDeOn;
                             });
                           }, icon:  ImageIcon(isProductDeOn? const AssetImage('assets/icons/downIconImage.png'): const AssetImage('assets/icons/nextIconImage.png'),size: 16,))
                         ],
                       ),
                     ),
                     isProductDeOn ?
                         const Padding(
                           padding: EdgeInsets.only(left: 16.0,right: 16),
                           child: Text('Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                           style: TextStyle(fontSize: 13,color: Color(0xFF7C7C7C)),
                           ),
                         ):
                         const SizedBox(height: 1,width: 1,),
                     const Padding(
                       padding: EdgeInsets.only(left: 16.0,right: 16),
                       child: Divider(thickness: 1,),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 16.0,right: 16,),
                       child: Row(
                         children: [
                           const Text('Nutritions',style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                           ),),
                           const Spacer(),
                           Container(
                             decoration: BoxDecoration(
                               color: const Color(0xFFF2F3F2),
                               borderRadius: BorderRadius.circular(5)
                             ),
                             child: const Padding(
                               padding: EdgeInsets.all(5.0),
                               child: Center(child: Text('100gm',style: TextStyle(
                                 color: Color(0xFF7C7C7C)
                               ),)),
                             ),
                           ),
                           IconButton(onPressed: (){
                             setState(() {
                               isNutritionsDeOn = !isNutritionsDeOn;
                             });
                           }, icon:  ImageIcon(isNutritionsDeOn? const AssetImage('assets/icons/downIconImage.png'): const AssetImage('assets/icons/nextIconImage.png'),size: 16,))
                         ],
                       ),
                     ),
                     isNutritionsDeOn ?
                     const Padding(
                       padding: EdgeInsets.only(left: 16.0,right: 16),
                       child: Text('Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                         style: TextStyle(fontSize: 13,color: Color(0xFF7C7C7C)),
                       ),
                     ):
                     const SizedBox(height: 1,width: 1,),
                     const Padding(
                       padding: EdgeInsets.only(left: 16.0,right: 16),
                       child: Divider(thickness: 1,),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 16.0,right: 16,),
                       child: Row(
                         children: [
                           const Text('Review',style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                           ),),
                           const Spacer(),
                          starIconsWidget(),
                          starIconsWidget(),
                          starIconsWidget(),
                          starIconsWidget(),
                          starIconsWidget(),
                           IconButton(onPressed: (){
                             setState(() {
                               isReViewDeOn = !isReViewDeOn;
                             });
                           }, icon:  ImageIcon(isReViewDeOn? const AssetImage('assets/icons/downIconImage.png'): const AssetImage('assets/icons/nextIconImage.png'),size: 16,))
                         ],
                       ),
                     ),
                     isReViewDeOn ?
                     const Padding(
                       padding: EdgeInsets.only(left: 16.0,right: 16),
                       child: Text('Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                         style: TextStyle(fontSize: 13,color: Color(0xFF7C7C7C)),
                       ),
                     ):
                     const SizedBox(height: 1,width: 1,),
                     const Padding(
                       padding: EdgeInsets.only(left: 16.0,right: 16),
                       child: Divider(thickness: 1,),
                     ),
                     const SizedBox(height: 80,)
                   ],
                 ),
               )

            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25.0,right: 25,top: 20),
        child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(onPressed: ()async{
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder:
              //         (context) =>
              //     const LogInScreen()));
              final cartData = DbModel(
                name: widget.name,
                weight: widget.weight,
                image: widget.image,
                rate: widget.rate,
                fixRate: widget.fixRate,
                noPieces: widget.noPieces,
              );
              await dbHelper.insertMyCart(cartData);
             ConstWidgetType.toast();
              Navigator.pop(context);
            },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ConstWidgetType.greenColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )
                )
            ), child: const Text('Add To Basket',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }

  Padding starIconsWidget() => const Padding(
    padding: EdgeInsets.all(2.0),
    child: ImageIcon(AssetImage('assets/icons/starIconImage.png'),size: 20,color: Color(0xFFF3603F),),
  );
}
