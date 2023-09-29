import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/mobilNoLogin/mobilOtpScreen.dart';

class LoginMobilNoScreen extends StatefulWidget {
  const LoginMobilNoScreen({super.key});

  @override
  State<LoginMobilNoScreen> createState() => _LoginMobilNoScreenState();
}

class _LoginMobilNoScreenState extends State<LoginMobilNoScreen> {
 TextEditingController mobileNoController = TextEditingController();
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
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0,right: 6,top: 16),
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
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Enter your mobile number',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24,),
                     const Padding(
                      padding:  EdgeInsets.only(left: 8.0),
                      child:  Text(
                        'Mobile Number',
                        style: TextStyle(
                          color: Color(0xFF7C7C7C),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CountryCodePicker(
                          onChanged: print,
                          initialSelection: 'IN',
                          favorite: ['+91','IN'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,

                        ),
                        SizedBox(height:50,width: MediaQuery.of(context).size.width/1.5,child: TextField(
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                         // maxLength: 10,
                          controller: mobileNoController,
                          keyboardType: TextInputType.number,
                          inputFormatters:[
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration:  const InputDecoration(
                            counter: Offstage(),
                            border: InputBorder.none, hintText: '',
                          ),
                          maxLines: 1,
                        ),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0,right: 16),
                      child: Container(height: 1,width: MediaQuery.of(context).size.width,
                      color: const Color(0xFFE2E2E2),
                      ),
                    )
                  ],
                ),
              ),
            ),]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor:ConstWidgetType.greenColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) =>
              const MobileOtpScreen()));
        },
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

 // Future<void> signInWithPhoneNumber(String phoneNumber) async {
 //   FirebaseAuth _auth = FirebaseAuth.instance;
 //
 //   try {
 //     await _auth.verifyPhoneNumber(
 //       phoneNumber: phoneNumber,
 //       verificationCompleted: (PhoneAuthCredential credential) async {
 //         // Automatically sign in if verification is completed.
 //         await _auth.signInWithCredential(credential);
 //       },
 //       verificationFailed: (FirebaseAuthException e) {
 //         print("Verification Failed: ${e.message}");
 //       },
 //       codeSent: (String verificationId, int? resendToken) {
 //         // Store the verification ID for later use (e.g., in a state variable).
 //       },
 //       codeAutoRetrievalTimeout: (String verificationId) {
 //         // Handle timeout here.
 //       },
 //     );
 //   } catch (e) {
 //     print("Error: $e");
 //   }
 // }

}
