import 'package:flutter/material.dart';
import 'package:testapp/Order/orderHistoryScreen.dart';
import 'package:testapp/constWidget/constWidgetType.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isOrder = false;
  bool isDetails = false;
  bool isDelivery = false;
  bool isPayment = false;
  bool isPromoCode = false;
  bool isNotifications = false;
  bool isHelp = false;
  bool isAbout = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30,),
               ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  child: Image(image: AssetImage('assets/icons/accountProfileImage.png')),),
                title: SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      const Text('Afsar Hossen',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                      const SizedBox(width: 10,),
                      ImageIcon(const AssetImage('assets/icons/editIcon.png'),color: ConstWidgetType.greenColor,size: 16,)
                    ],
                  ),
                ),
                 subtitle: const Text('Imshuvo97@gmail.com',style: TextStyle(
                   fontSize: 16
                 ),),
              ),
              const SizedBox(height: 10,),
              const Divider(
                thickness: 1,
              ),

              accountColumnOpen(
                'assets/icons/orderIcon.png',
                'Orders',
                isOrder,
                () {
                  setState(() {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderHistoryScreen()));
                  });
                },
              ),
              accountColum(
                'assets/icons/detailsIcon.png',
                'MyDetails',
                isDetails,
                () {
                  setState(() {
                    isDetails = !isDetails;
                  });
                },
              ),
              accountColum(
                'assets/icons/locationIcon.png',
                'Delivery Address',
                isDelivery,
                () {
                  setState(() {
                    isDelivery = !isDelivery;
                  });
                },
              ),
              accountColum(
                'assets/icons/paymentCardIcon.png',
                'Payment Methods',
                isPayment,
                () {
                  setState(() {
                    isPayment = !isPayment;
                  });
                },
              ),
              accountColum(
                'assets/icons/promoCodeIcon.png',
                'Promo Cord',
                isPromoCode,
                () {
                  setState(() {
                    isPromoCode = !isPromoCode;
                  });
                },
              ),
              accountColum(
                'assets/icons/notificationsIcon.png',
                'Notifications ',
                isNotifications,
                () {
                  setState(() {
                    isNotifications = !isNotifications;
                  });
                },
              ),
              accountColum(
                'assets/icons/helpIcon.png',
                'Help ',
                isHelp,
                () {
                  setState(() {
                    isHelp = !isHelp;
                  });
                },
              ),
              accountColum(
                'assets/icons/aboutIcon.png',
                'About ',
                isAbout,
                () {
                  setState(() {
                    isAbout = !isAbout;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25.0,right: 25,top: 20),
        child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder:
              //         (context) =>
              //     const LogInScreen()));
            },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFF2F3F2)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )
                )
            ), child:  Row(
              children: [
                ImageIcon(const AssetImage('assets/icons/logOutIcon.png'),color: ConstWidgetType.greenColor,),
                const Spacer(),
                 Text('Log Out',style: TextStyle(color:ConstWidgetType.greenColor,fontSize: 18,fontWeight: FontWeight.w600),),
                const Spacer(),
                const SizedBox(width: 20,),
              ],
            ),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  accountColum(String image, String type, bool isType, VoidCallback onTap) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16,
          ),
          child: Row(
            children: [
              ImageIcon(
                AssetImage(image),
                size: 20,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                type,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    onTap();
                  },
                  icon: ImageIcon(
                    isType
                        ? const AssetImage('assets/icons/downIconImage.png')
                        : const AssetImage('assets/icons/nextIconImage.png'),
                    size: 12,
                  ))
            ],
          )),
      isType
          ? const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16),
              child: Text(
                'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                style: TextStyle(fontSize: 13, color: Color(0xFF7C7C7C)),
              ),
            )
          : const SizedBox(
              height: 1,
              width: 1,
            ),
      const Divider(
        thickness: 1,
      ),
    ]);
  }
  accountColumnOpen(String image, String type, bool isType, VoidCallback onTap){
    return
      InkWell(
        onTap: (){
          onTap();
        },
        child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
            ),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage(image),
                  size: 20,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  type,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      //onTap();
                    },
                    icon: const ImageIcon(
                      AssetImage('assets/icons/nextIconImage.png'),
                      size: 12,
                    ))
              ],
            )),
      );
  }
}
