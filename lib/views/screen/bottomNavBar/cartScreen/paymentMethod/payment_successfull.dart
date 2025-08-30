import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/CustomWidget/TextWigget/text_widget.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/CartScreen/track_order.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/bottom_nav_bar.dart';

class PaymentSuccessfulScreen extends StatefulWidget {
  const PaymentSuccessfulScreen({super.key});

  @override
  State<PaymentSuccessfulScreen> createState() => _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState extends State<PaymentSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFfffff),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {

        }, icon: Icon(Icons.arrow_back_ios, color: Colors.black87, size: 20)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Image.asset( ImageConst.paymentSuccessful, // Replace with your success image path
                      height: 168,
                      width: 202,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Payment Successful',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Thank you for your payment!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextWidget.Text_20_600(text: "Order Details", color: Colors.black87),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xffFFF3DB)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     rowWidget(t1: "Order ID: ", t2: "20231008"),
                    SizedBox(height: 5),
                     rowWidget(t1: "Date:", t2: "25th Jun, 2025"),
                    SizedBox(height: 5),
                     rowWidget(t1: "Payment Method:", t2: "Credit Card"),
                    SizedBox(height: 5),
                     rowWidget(t1: "Amount:", t2: "AED 27.25"),
                    SizedBox(height: 5),
                     rowWidget(t1: "Status:", t2: "Success"),
                  ],
                ),
              ),
              SizedBox(height: 24,),
              CustomSubmitButton(text: "Track Order", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TrackOrderScreen(),));
              },),
              SizedBox(height: 15),
              CustomSubmitButton(
                backgroundColor: Colors.white,
                textColor: ColorConst.baseColor,
                text: "Back To Home", onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CustomBottomNavBar(),),
                    (route) => false,);
              },),
            ],
          ),
        ),
      ),
    );
  }
}

  Widget  rowWidget({
  required String t1,
  required String t2,
  }){
  return Row(
    children: [
      TextWidget.Text_18_600(fontSize: 15, text: "$t1", color: Colors.black45, fontWeight: FontWeight.w500,letterSpacing: -0.1),
      Spacer(),
      TextWidget.Text_18_600(fontSize: 16,text: "$t2", color: Colors.black87, fontWeight: FontWeight.w500,letterSpacing: -0.2),
    ],
  );
}