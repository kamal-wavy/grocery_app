import 'package:flutter/material.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/tabBar/BottomBarScreen.dart';

class OrderAcceptScreen extends StatefulWidget {
  const OrderAcceptScreen({super.key});

  @override
  State<OrderAcceptScreen> createState() => _OrderAcceptScreenState();
}

class _OrderAcceptScreenState extends State<OrderAcceptScreen> {
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/6.5,
            ),
            Container(
              height: MediaQuery.of(context).size.width/2,
              width: MediaQuery.of(context).size.width/2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/acceptOrderImage.png')
                )
              ),
            ),
            const SizedBox(height: 30,),
            const Text('Your Order has been \naccepted',style: TextStyle(
              fontSize: 28,fontWeight: FontWeight.w600,
            ),
            textAlign:TextAlign.center ,),
            const SizedBox(height: 20,),
            const Text('Your items has been placed and is on \nit’s way to being processed',style: TextStyle(
              fontSize: 16,
            ),
            textAlign:TextAlign.center ,),
            const Spacer(),
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
            InkWell(
                onTap: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                    return BottomBarScreen();
                  }), (r){
                    return false;
                  });
                 // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomBarScreen()));
                },
                child: const Text('Back to home',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),)),
          const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
