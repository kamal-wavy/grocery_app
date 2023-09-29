import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/constWidget/constWidgetType.dart';

import 'selectLocationScreen.dart';

class MobileOtpScreen extends StatefulWidget {
  const MobileOtpScreen({super.key});

  @override
  State<MobileOtpScreen> createState() => _MobileOtpScreenState();
}

class _MobileOtpScreenState extends State<MobileOtpScreen> {
  TextEditingController otpController = TextEditingController();
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ConstWidgetType.backGroundImage(context),
              SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 16,right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0,right: 6,top: 16,bottom: 16),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: const ImageIcon(AssetImage('assets/icons/backIconIos.png'),size: 18,)),
                          const Spacer()
                        ],
                      ),
                    ),
                    const SizedBox(height: 50,),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0,right: 8),
                      child: Text(
                        'Enter your 4-digit code',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0,right: 8),
                      child: Text(
                        'Code',
                        style: TextStyle(
                          color: Color(0xFF7C7C7C),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8),
                      child: SizedBox(height: 40,width: MediaQuery.of(context).size.width,child:  TextFormField(
                        //maxLength: 4,
                      controller: otpController,
                        keyboardType: TextInputType.number,
                        cursorColor: Color(0xFFE2E2E2),

                        inputFormatters:[
                          LengthLimitingTextInputFormatter(4),
                        ],

                        decoration:  const InputDecoration(
                          hintText: '-  -  -  -',
                        ),
                      ),),
                    ),
                  ],
                ),
              ),
            ),]
          ),
        ),
      ),
      floatingActionButton: Row(
        children: [
          const SizedBox(height: 1,width: 30,),
           Text('Resend Code',style: TextStyle(color: ConstWidgetType.greenColor,fontSize: 18),),
          const Expanded(child: SizedBox(height: 1,)),
          FloatingActionButton(backgroundColor: ConstWidgetType.greenColor,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) =>
                  const SelectLocationScreen()));
            },
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
