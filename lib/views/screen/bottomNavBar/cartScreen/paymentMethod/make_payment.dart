import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/CustomWidget/TextWigget/text_widget.dart';
import 'add_card_screen.dart';

class MakePaymentScreen extends StatefulWidget {
  const MakePaymentScreen({super.key});

  @override
  State<MakePaymentScreen> createState() => _MakePaymentScreenState();
}

class _MakePaymentScreenState extends State<MakePaymentScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Make Payment",
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
      ),
      body:Container(
        height: h,
        width: w,
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child:Column(
          children: [
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex=index;
                  });
                },
                child: Container(
                height: 80,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color:selectedIndex==index? ColorConst.baseColor.withValues(alpha: 0.7) : ColorConst.baseColor.withValues(alpha: 0.1)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget.Text_16(text: "Master Card", color: Colors.black87, fontWeight: FontWeight.w700),
                          Row(
                            children: [
                              Image.asset(ImageConst.mastercard, height: 30, width: 30),
                              SizedBox(width: 10,),
                              TextWidget.Text_16(text: "**** **** **** 1234", color: Colors.black87, fontWeight: FontWeight.w500)
                            ]
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_drop_down_outlined,size: 30, color: Colors.black87)
                    ],
                  ),
                            ),
              ),),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddCardScreen(),)),
              child: Container(
                height: 55,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.amber),
                    color: Colors.amber.withValues(alpha: 0.1)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add, size: 30, color: ColorConst.baseColor),
                      SizedBox(width: 5,),
                      TextWidget.Text_14(text: "Add New", color: ColorConst.baseColor, fontWeight: FontWeight.w400)
                    ],
                  ),
                )
              ),
            ),
            Spacer(),
            CustomSubmitButton(text: "Make Payment", onPressed: () {
              
            },),
            SizedBox(height: 20,)
          ],
        ) ,
      )
    );
  }
}
