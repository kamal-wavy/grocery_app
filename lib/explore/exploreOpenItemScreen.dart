import 'package:flutter/material.dart';
import 'package:testapp/Filters/filterScreen.dart';
import 'package:testapp/constWidget/constWidgetType.dart';
import 'package:testapp/localDataBase/dbHelperModel.dart';
import 'package:testapp/localDataBase/localDbHelper.dart';

class ExploreOpenItemScreen extends StatefulWidget {
  List<Map<String,Object>> beveragesList = [];
  String name ='';
   ExploreOpenItemScreen({super.key, required this.beveragesList,required this.name});

  @override
  State<ExploreOpenItemScreen> createState() => _ExploreOpenItemScreenState();
}

class _ExploreOpenItemScreenState extends State<ExploreOpenItemScreen> {
  @override
  //List<Map<String,dynamic>> beveragesList = ConstWidgetType.beveragesList;
  final dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,right: 16,left: 16,bottom: 8),
            child: Column(
              children: [
                const SizedBox(height: 16,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: const ImageIcon(AssetImage('assets/icons/backIconIos.png'),size: 18,)),

                     Text(widget.name,style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),),
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const FilterScreen()));
                    }, icon: Container(height: 18,width: 18,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/menuIconImage.png')
                      )
                    ),
                    ))],
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: MediaQuery.of(context).size.height/1.16,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    itemCount: widget.beveragesList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 250,
                    ), itemBuilder: (BuildContext context, int index) {
                    return ConstWidgetType.fruitContainer(context,widget.beveragesList[index]['image'].toString(),widget.beveragesList[index]['name'].toString(),widget.beveragesList[index]['weight'].toString(),widget.beveragesList[index]['rate'].toString(),widget.beveragesList[index]['noPices'].toString(),widget.beveragesList[index]['fixRate'].toString());
                  },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
