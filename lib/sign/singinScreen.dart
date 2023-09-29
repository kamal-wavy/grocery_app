import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:testapp/mobilNoLogin/loginMobileNoScreen.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 5,right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/icons/singInImage.png'
                      )
                    )
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Get your groceries\nwith nectar',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      child: const CountryCodePicker(
                        onChanged: print,
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'IN',
                        favorite: ['+91','IN'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,

                      ),
                    ),

                    // SizedBox(height: 40,width: MediaQuery.of(context).size.width/1.5,child: const TextField(
                    //   maxLength: 10,
                    //   keyboardType: TextInputType.number,
                    // ),)
                  ],
                ),
                 Padding(
                   padding: const EdgeInsets.only(left: 16.0,right: 16),
                   child: Container(height: 1,width: MediaQuery.of(context).size.width,color: const Color(0xFFE2E2E2),)
                 ),
                 const SizedBox(height: 20,),
                 Row(
                  children: [
                   const Expanded(child: SizedBox(height: 1,)),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) =>
                            const LoginMobilNoScreen()));
                      },
                      child: const Text(
                        'Or connect with social media',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF828282)
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox(height: 1,)),
                  ],
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 12,right:12,top: 20),
                  child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder:
                        //         (context) =>
                        //     const SingInScreen()));
                      },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF5383EC)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )
                          )
                      ), child:  Row(
                        children: [
                          const SizedBox(width: 20,),
                          Container(
                            height: 24,
                            width: 22,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/icons/googleLogoImage.png')
                                )
                            ),
                          ),
                          const SizedBox(width: 20,),
                          const Text('Continue with Google',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18)),
                        ],
                      ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12,top: 20),
                  child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder:
                        //         (context) =>
                        //     const SingInScreen()));
                      },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF4A66AC)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )
                          )
                      ), child:  Row(
                        children: [
                          const SizedBox(width: 20,),
                          Container(
                            height: 24,
                            width: 22,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/facebookLogoImage.png')
                              )
                            ),
                          ),
                          const SizedBox(width: 20,),
                          const Text('Continue with Facebook',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                        ],
                      ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
