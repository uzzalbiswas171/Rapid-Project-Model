import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/CartScreen/checkout_screen.dart';


class SubscribeScreen extends StatefulWidget {
  const SubscribeScreen({super.key});

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  final TextEditingController _emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Join our newsletter to receive exclusive updates on special deals and discounts directly to your inbox!',
               textAlign: TextAlign.center
                ,
                style: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
                fontSize: 16,

              ),)
            ),
            SizedBox(height: 20,),
            textFieldLabel(controller: _emailController,hinText: "Enter Email"),
            SizedBox(height: 20,),
            CustomSubmitButton(text: "Subscribe me", onPressed: () {

            },)
          ],
        ),
      ),
    );
  }
}
