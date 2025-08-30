import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Views/CustomWidget/TextWigget/text_widget.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // light peach background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          color: ColorConst.baseColor.withValues(alpha: 0.5),
          padding: EdgeInsetsGeometry.only(top: 30),
          child: AppBar(
            elevation: 0,
            backgroundColor: ColorConst.baseColor.withValues(alpha: 0.0),
            centerTitle: true,
            leading: BackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Notification",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                letterSpacing: -0.3,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(10),
              color: ColorConst.baseColor.withValues(alpha: 0.07),
            ),
            child: ListTile(
              onTap: () {},
              leading: Icon(Icons.notifications_none, size: 22),
              title: TextWidget.Text_12(
                text: "2024-10-15",
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
              subtitle: TextWidget.Text_16(
                text: "Order #12 Has Been Processed.",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
