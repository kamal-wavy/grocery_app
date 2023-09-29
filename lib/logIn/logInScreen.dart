import 'package:flutter/material.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/logIn/signUpScreen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children:
            [
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
                  const Text('Login',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                  ) ,
                  const SizedBox(height: 16,),
                  const Text('Enter your emails and password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF7C7C7C),
                  ),
                  ),
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
                    controller: emailController,
                    style: const TextStyle(
                      fontSize: 18
                    ),
                    keyboardType: TextInputType.emailAddress,
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
                    controller: passwordController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: isShowPassword,
                    style: const TextStyle(
                      fontSize: 18
                    ),
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
                  const SizedBox(height: 16,),
                  const Row(
                    children: [
                      Spacer(),
                      Text('Forgot Password?',style: TextStyle(
                        fontSize: 16
                      ),),
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
                              const SignUpScreen()));
                        },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ConstWidgetType.greenColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                )
                            )
                        ), child: const Text('Log In',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                        )),
                  ),
                  const SizedBox(height: 20,),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Spacer(),
                      const Text('Don’t have an account? ',style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),),
                      InkWell(
                        onTap: (){},
                        child:  Text('Singup',style: TextStyle(color: ConstWidgetType.greenColor,
                        fontWeight: FontWeight.w600,fontSize: 18,
                        ),),
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),]
          ),
        ),
      ),
    );
  }
}
