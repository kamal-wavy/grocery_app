import 'package:flutter/material.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/home/homeScreen.dart';
import 'package:testapp/tabBar/BottomBarScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShowPassword = true;
  bool isEmail = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ConstWidgetType.backGroundImage(context),
              Padding(
              padding: const EdgeInsets.only(top: 12.0,left: 18,right: 18),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80,),
                  Row(
                    children: [const Spacer(),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/icons/carretImage.png'
                                )
                            )
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 100,),
                  const Text('Sign Up',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ) ,
                  const SizedBox(height: 15,),
                  const Text('Enter your credentials to continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                  const SizedBox(height: 35,),
                  const Text('Username',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                  SizedBox(height: 40,width: MediaQuery.of(context).size.width,child: TextField(
                    // maxLength: 10,
                    style: const TextStyle(
                      fontSize: 18
                    ),
                    controller: userNameController,
                    keyboardType: TextInputType.emailAddress,
                  ),),
                  const SizedBox(height: 30,),
                  const Text('Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                  SizedBox(height: 40,width: MediaQuery.of(context).size.width,child: TextField(
                    // maxLength: 10,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    onChanged: (text){
                      if(emailController.text.endsWith('@gmail.com')){
                        setState(() {
                          isEmail = true;
                        });
                      }else{
                        setState(() {
                          isEmail = false;
                        });
                      }

                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:  InputDecoration(
                        suffixIconConstraints: const BoxConstraints(
                            minHeight: 20,
                            minWidth: 20
                        ),
                      suffixIcon: isEmail ? ImageIcon(const AssetImage('assets/icons/checkIconImage.png'),color: ConstWidgetType.greenColor,size: 14,)
                          : const SizedBox(height: 1,width: 1,)
                    ),
                  ),),
                  const SizedBox(height: 30,),
                  const Text('Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                  SizedBox(height: 40,width: MediaQuery.of(context).size.width,child: TextField(
                    // maxLength: 10,
                    style: const TextStyle(
                      fontSize: 18
                    ),
                    controller: passwordController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: isShowPassword,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              isShowPassword = !isShowPassword;
                            });
                          },
                          child: isShowPassword ?const Icon(Icons.visibility_off,color: Colors.black,):
                          const Icon(Icons.visibility,color: Colors.blue,),
                        )
                    ),
                  ),),
                  const SizedBox(height: 30,),
                   Row(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('By continuing you agree to our ',
                        style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),),
                      InkWell(
                        onTap: (){},
                        child:  Text('Terms of Service',style: TextStyle(color: ConstWidgetType.greenColor,
                          fontWeight: FontWeight.w600,fontSize: 18,
                        ),),
                      ),
                    ],
                  ),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('and ',
                        style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),),
                      InkWell(
                        onTap: (){},
                        child:  Text('Privacy Policy.',style: TextStyle(color: ConstWidgetType.greenColor,
                          fontWeight: FontWeight.w600,fontSize: 18,
                        ),),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0,right: 30,top: 20),
                    child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder:
                                  (context) =>
                              const BottomBarScreen()));
                        },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ConstWidgetType.greenColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                )
                            )
                        ), child: const Text('Sing Up',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                        ),
                        )),
                  ),
                  const SizedBox(height: 20,),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Spacer(),
                      const Text('Already have an account? ',style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),),
                      InkWell(
                        onTap: (){},
                        child:  Text('Signup',style: TextStyle(color: ConstWidgetType.greenColor,
                          fontWeight: FontWeight.w600,fontSize: 18,
                        ),),
                      ),
                      const Spacer(),
                    ],
                  ),

                  //SizedBox(height: MediaQuery.of(context).size.height/7,)
                ],
              ),
                ),
            ]
          ),
        ),
      ),
    );
  }
}
