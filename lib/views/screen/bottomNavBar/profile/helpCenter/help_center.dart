import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Views/CustomWidget/HomeWidget/home_widget.dart';
import 'package:rapid_super_market/Views/CustomWidget/TextWigget/text_widget.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/HomeScreen/LiveBookTable/live_book_table.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/Profile/HelpCenter/Subscribe/subscribe.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  bool selectTapFaq= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(100), child: Container(
        color: ColorConst.baseColor.withValues(alpha: 0.5),
        padding: EdgeInsetsGeometry.only(
            top: 30
        ),
        child: AppBar(
          elevation: 0,
          backgroundColor: ColorConst.baseColor.withValues(alpha: 0.0),
          centerTitle: true,
          leading: BackButton(color: Colors.black,onPressed: () {
            Navigator.pop(context);
          },),
          title:   Text("Help Center",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600 ,fontSize:18,letterSpacing: -0.3 ),),
          actions: [
            NotificationCounter(),
            SizedBox(width: 10,),
          ],
        ),
      ),
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget.Text_16(text: "Hi, how can we help you?",fontWeight: FontWeight.w700),
                  SizedBox(height: 8,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: SearchAndFilterBar(is_filter: false,),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(),
              border: Border(
                bottom: BorderSide(width: 1,color: Colors.black12)
              )
              ),
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectTapFaq=true;
                          });
                        },
                        child: Container(
                          height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1,color:selectTapFaq==true? Colors.black : Colors.black38)
                          )
                                            ),
                          child: TextWidget.Text_16(text: "FAQ",fontWeight: FontWeight.w600,color:  selectTapFaq==true? Colors.black : Colors.black38),
                                          ),
                      ),
                  ),
                  Expanded(
                    child:GestureDetector(
                      onTap: () {
                        setState(() {
                          selectTapFaq=false;
                        });
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 1,color:selectTapFaq==true? Colors.black38 : Colors.black)
                            )
                        ),
                        child: TextWidget.Text_16(text: "Contact Us",fontWeight: FontWeight.w600,color: selectTapFaq==true? Colors.black38 : Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            selectTapFaq==true?  Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConst.baseColor.withValues(alpha: 0.07)
                    ),
                    child : Column(
                      children: [
                        Row(
                          children: [
                            Text("How do I manage my notifications?"),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                        Divider( ),
                        TextWidget.Text_12(text:'To manage notifications, go to  Settings,  "select" Notification Settings," and customize your preferences.')

                      ],
                    ),
                  );
                },),
              ),
            ):
            Expanded(child:Container(
              padding: EdgeInsets.all(16),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SubscribeScreen(),),),
                      child: _widget(img: list[index], title: nameList[index]));
                },),
            ), )
          ],
        ),
      ),
    );
  }
  List list=[
   ImageConst.earphone,
    ImageConst.earth,
   ImageConst.twiter,
   ImageConst.subscribe,
  ];
  List nameList=[
   "Customer Services",
   "Website",
   "Twitter",
   "Subscribe",
  ];
}
Widget _widget({
  required String img,
  required String title,
}){
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.symmetric(horizontal: 13,vertical: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConst.baseColor.withValues(alpha: 0.07)
    ),
    child : Row(
      children: [
        Image.asset(img,height: 16,width: 16,),
        SizedBox(width: 10,),
        TextWidget.Text_16(text: title,fontWeight: FontWeight.w600,letterSpacing: -0.3),
      ],
    ),
  );
}