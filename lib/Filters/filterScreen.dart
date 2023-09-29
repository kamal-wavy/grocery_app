import 'package:flutter/material.dart';
import 'package:testapp/constWidget/constWidgetType.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const ImageIcon(AssetImage('assets/icons/deleteIconImage.png'),size: 16,)),
                  const Text('Filters',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                  const SizedBox(height: 20,width: 50,)
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height/1.12,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                  color: Color(0xFFF2F3F2)
                ),
                child:  Padding(
                  padding: const EdgeInsets.only(top: 24.0,right: 20,left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Categories',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24),),
                     const SizedBox(height: 20,),
                      CustomRadioButtonCateg('Eggs',1),
                      CustomRadioButtonCateg('Noodles & Pasta',2),
                      CustomRadioButtonCateg('Chips & Crisps',3),
                      CustomRadioButtonCateg('Fast Food',4),
                      const SizedBox(height: 30,),
                      const Text('Brand',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24),),
                      const SizedBox(height: 20,),
                      CustomRadioButtonBrand('Individual Callection',1),
                      CustomRadioButtonBrand('Cocola',2),
                      CustomRadioButtonBrand('Ifad',3),
                      CustomRadioButtonBrand('Kazi Farmas',4),
                    ],
                  ),
                ),
              ),
            )
          ],
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
            },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ConstWidgetType.greenColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )
                )
            ), child: const Text('Apply Filter',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            ),

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
  int valueCategories = 0;
   CustomRadioButtonCateg(String text, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            valueCategories = index;
          });
        },
        child: Row(
          children: [
            (valueCategories == index ) ? Container(
              height: 20,width: 20,
              decoration:  BoxDecoration(
                color: ConstWidgetType.greenColor,
                borderRadius: BorderRadius.circular(4)
              ),
              child: const Padding(
                padding: EdgeInsets.all(3.0),
                child: Image(image: AssetImage('assets/icons/checkIconImage.png')),
              ),
            ):
                Container(
                  height: 20,width: 20,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: const Color(0xFFB1B1B1))
                  ),
                ),
            const SizedBox(width: 10,),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: (valueCategories == index) ? Colors.green : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
  int valueBrand = 0;
   CustomRadioButtonBrand(String text, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            valueBrand = index;
          });
        },
        child: Row(
          children: [
            (valueBrand == index ) ? Container(
              height: 20,width: 20,
              decoration:  BoxDecoration(
                color: ConstWidgetType.greenColor,
                borderRadius: BorderRadius.circular(4)
              ),
              child: const Padding(
                padding: EdgeInsets.all(3.0),
                child: Image(image: AssetImage('assets/icons/checkIconImage.png')),
              ),
            ):
                Container(
                  height: 20,width: 20,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: const Color(0xFFB1B1B1))
                  ),
                ),
            const SizedBox(width: 10,),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: (valueBrand == index) ? Colors.green : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
