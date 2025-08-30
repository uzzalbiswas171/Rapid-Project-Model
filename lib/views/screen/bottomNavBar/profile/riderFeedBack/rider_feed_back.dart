import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Views/CustomWidget/TextWigget/text_widget.dart';

import '../../HomeScreen/LiveBookTable/live_book_table.dart';

class RiderFeedBack extends StatefulWidget {
  const RiderFeedBack({super.key});

  @override
  State<RiderFeedBack> createState() => _RiderFeedBackState();
}

class _RiderFeedBackState extends State<RiderFeedBack> {
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
          title:   Text("Rider Feedback",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600 ,fontSize:18,letterSpacing: -0.3 ),),
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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: ColorConst.baseColor.withValues(alpha: 0.07),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(ImageConst.star,height: 30,width: 30,color: ColorConst.baseColor,),
                      SizedBox(width: 5,),
                      TextWidget.Text_18_600(text: "4.0",fontWeight: FontWeight.w700,letterSpacing: 0.3,fontSize: 30)
                    ],
                  ),
                  TextWidget.Text_20_600(text: "Average Rating",letterSpacing: -0.3),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(top: 10),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: ColorConst.baseColor.withValues(alpha: 0.07),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   ListTile(
                     contentPadding: EdgeInsets.only(left: 5,right: 5,top: 0,bottom: 0),
                     //   leading: CircleAvatar(radius: 30),
                     leading: ClipRRect(
                         borderRadius: BorderRadiusGeometry.circular(100),
                         child: Image.network(ImageConst.netProfile,fit: BoxFit.fill,height: 60,width: 60,)),
                     title: TextWidget.Text_16(text: "Afzal Karim",letterSpacing: -0.2,fontWeight: FontWeight.w700),
                     subtitle: TextWidget.Text_14(text: "12-08-2024, 05.15 PM",letterSpacing: 0.01,color: Colors.black45,fontWeight: FontWeight.w400),
                     trailing: SizedBox(
                       height: 15,
                       child: ListView.builder(
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                           itemCount: 5,
                           scrollDirection: Axis.horizontal,
                           itemBuilder: (context, index) => Image.asset(ImageConst.starBooked,height: 15,width: 15,fit: BoxFit.fill,),
                       ),
                     ),
                   ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextWidget.Text_20_600(text: "Average Rating",letterSpacing: -0.3),
                    ),
                  ],
                ),
              ),),
            )
          ],
        ),
      ),
    );
  }
}
