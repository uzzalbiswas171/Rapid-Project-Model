import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Core/LocalDataBase/SharePref/share_prefrence.dart';
import 'package:rapid_super_market/Views/CustomWidget/TextWigget/text_widget.dart';

import 'AddressSet/set_address.dart';
import 'ChangePassword/change_password.dart';
import 'HelpCenter/help_center.dart';
import 'NotificationScreen/notification_screen.dart';
import 'Orders/orders.dart';
import 'PersonalProfile/personal_profile.dart';
import 'RiderFeedBack/rider_feed_back.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87, size: 20),
        ),
        actions: [
          IconButton(onPressed: () {
            
          }, icon: Icon(Icons.more_horiz_outlined, color: Colors.black87, size: 20)),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileListTileWithSwitch(image: "image", title: "title", value: true, onChanged: (value) {

              },),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color:ColorConst.baseColor.withValues(alpha: 0.07),
                  ),
                child: Column(
                  children: [
                    profileListTile(image: ImageConst.person, title: "Personal Info", onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalProfile(),));
                    },),
                    SizedBox(height: 10,),
                    profileListTile(image: ImageConst.map, title: "Addresses", onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryAddressScreen(),));
                    },),
                  ],
                ),
                ),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: ColorConst.baseColor.withValues(alpha: 0.07),
                ),
                child: Column(
                  children: [
                    profileListTile(image: ImageConst.notification, title: "Notifications", onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen(),));
                    },),
                    SizedBox(height: 10,),
                    profileListTile(image: ImageConst.cardProfile, title: "Payment Method", onTap: () {},),
                    SizedBox(height: 10,),
                    profileListTile(image: ImageConst.cardProfile, title: "Help Centre", onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HelpCenter(),));
                    },),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: ColorConst.baseColor.withValues(alpha: 0.07),
                ),
                child: Column(
                  children: [
                    profileListTile(image: ImageConst.review, title: "Reviews", onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RiderFeedBack(),));
                    },),
                    SizedBox(height: 10,),
                    profileListTile(image: ImageConst.orderList, title: "Orders", onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrderScreen(),));
                    },),
                    SizedBox(height: 10,),
                    profileListTile(image: ImageConst.setting, title: "Change Password", onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword(),));
                    },),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: ColorConst.baseColor.withValues(alpha: 0.07),
                ),
                child: Column(
                  children: [
                    profileListTile(image: ImageConst.logOut, title: "Log Out", onTap: () {
                      PrefsHelper.logout(context);
                    },),
                   ],
                ),
              ),
              SizedBox(height: 40,)
            ],
          ),
        ),
      )
    );
  }
}

Widget profileListTile({
  required String image,
  required String title, 
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Row(
        children: [
        Image.asset(image, height: 30, width: 30),
        SizedBox(width: 10,),
        TextWidget.Text_16(text: title, color: Colors.black87, fontWeight: FontWeight.w400),
        Spacer(),
        Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 17)
      ],),
    ),
  );
}

Widget profileListTileWithSwitch({
  required String image,
  required String title,
  required bool value,
  required ValueChanged<bool> onChanged,
}) {
  return Row(
    children: [
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadiusGeometry.circular(100),
            image: DecorationImage(image: NetworkImage(ImageConst.netWorkImageTEst),fit: BoxFit.fill)
        ),
      ),
      SizedBox(width: 20,),
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget.Text_20_600(text: "John Doe", color: Colors.black87,fontWeight: FontWeight.w700),
          SizedBox(height: 5,),
          TextWidget.Text_14(text: "I am flutter Developer", color: Colors.black38),
        ],
      ))
    ],
  );
}


