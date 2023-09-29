import 'package:flutter/material.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/sign/singinScreen.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icons/welcomeImage.png'
                ),fit: BoxFit.fill
              )
            ),
          ),
          Container(
            child: Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/2.4),
              child: Align(
               alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      height: 56,
                      width: 48,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/icons/img.png'
                              )
                          )
                      ),
                    ),
                    const SizedBox(height: 24,),
                    const Text(
                      'Welcome\nto our store',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),textAlign: TextAlign.center,
                    ) ,
                    SizedBox(height: 10,),
                    const Text(
                      'Ger your groceries in as fast as one hour',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(252, 252, 252, 0.7),                        ),textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30,top: 20),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                          child: ElevatedButton(onPressed: (){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder:
                            (context) =>
                            const SingInScreen()));
                          },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ConstWidgetType.greenColor),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                  )
                              )
                          ), child: const Text('Get Started',style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.w600
                          ),),
                          )),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
