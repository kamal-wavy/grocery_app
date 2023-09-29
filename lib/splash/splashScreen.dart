import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/onBording/onBordingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 5),
            (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
              (context) =>
              const OnBordingScreen()
              ));
            }

    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: ConstWidgetType.greenColor,
      body: Center(
        child: Container(
          width: 250,
          height: 70,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/appLogoImage.png')
            )
          ),
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Container(
        //       height: 60,
        //       width: 55,
        //       decoration: const BoxDecoration(
        //         image: DecorationImage(
        //           image: AssetImage(
        //             'assets/icons/img.png'
        //           )
        //         )
        //       ),
        //     ),
        //     Container(
        //       height: 70,
        //       width: 100,
        //      child: const Column(
        //        children: [
        //          Text('nectar',
        //          style: TextStyle(
        //            fontSize: 32,
        //            color: Colors.white,
        //          ),
        //          ),
        //          Text('online groceries',
        //          style: TextStyle(
        //            fontSize: 13,
        //            color: Colors.white,
        //          ),
        //          ),
        //        ],
        //      ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
