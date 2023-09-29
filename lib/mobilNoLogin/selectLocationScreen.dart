import 'package:flutter/material.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/logIn/logInScreen.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  @override
  String dropdownvalue = 'Item 1';
  String dropdownvalue2 = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ConstWidgetType.backGroundImage(context),
              Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Row(
                        children: [
                          InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                          const Spacer()
                        ],
                      ),
                      Container(height: 200,width: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/locationImage.png')
                        )
                      ),
                      ),
                      SizedBox(height: 15,),
                      const Text('Select Your Location',style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26
                      ),),
                      const SizedBox(height: 8,),
                      const SizedBox(height: 10,),
                      const Text('Switch on your location to stay in tune with\nwhat’s happening in your area',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF7C7C7C),
                      ),
                      textAlign: TextAlign.center,

                      ),
                      const SizedBox(height: 100,),
                      const Row(
                        children: [
                          Text('Your Zone',style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF7C7C7C),
                          ),),
                          Spacer()
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                           // underline: Container(color: Colors.transparent),
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Padding(
                                  padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width/1.4),
                                  child: Text(items),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 30,),
                       const Row(
                        children: [
                          Text('Your Area',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF7C7C7C),
                          ),
                          ),
                          Spacer()
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            //underline: Container(color: Colors.black),
                            value: dropdownvalue2,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Padding(
                                  padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width/1.4),
                                  child: Text(items),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue2 = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 100,),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,right: 30,top: 20),
                        child: SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: ElevatedButton(onPressed: (){
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder:
                                      (context) =>
                                  const LogInScreen()));
                            },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ConstWidgetType.greenColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )
                                )
                            ), child: const Text('Submit',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),]
          ),
        ),
      ),
    );
  }
}
