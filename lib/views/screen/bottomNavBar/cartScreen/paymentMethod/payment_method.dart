import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Views/CustomWidget/TextWigget/text_widget.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/CartScreen/cart_creen.dart';
import '../checkout_screen.dart';
import 'make_payment.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:   Text(
          "Payment Method",
          style: const TextStyle(
            fontSize: 18, // Slightly larger title
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black87,size: 20,)),

      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderSummaryCard(),
              SizedBox(height: 16,),
              TextWidget.Text_16(text: "Delivery Address:",fontWeight: FontWeight.w700),
              SizedBox(height: 12,),
              homeAddress(context: context),
              SizedBox(height: 12,),
              apertMentAddress(context),
              SizedBox(height: 16,),
              TextWidget.Text_16(text: "Payment Method:",fontWeight: FontWeight.w700),
              SizedBox(height: 12,),
              Container(
                height: 55,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: ColorConst.baseColor.withValues(alpha: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Image.asset(ImageConst.paypalCard, height: 24, width: 24, color: Colors.black38),
                        SizedBox(width: 10,),
                        TextWidget.Text_16(text: "Card Payment",fontWeight: FontWeight.w600),
                      ]),
                    )),
                    SizedBox(width: 20,),
                    Expanded(child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.01),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 0.5,
                          color: Colors.black38
                        )
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Image.asset(ImageConst.bank, height: 24, width: 24, color: ColorConst.baseColor),
                        SizedBox(width: 10,),
                        TextWidget.Text_16(text: "Bank Transfer",fontWeight: FontWeight.w600),
                      ]),
                    )),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              TextWidget.Text_16(text: "Debit / Credit Card",fontWeight: FontWeight.w700),
              SizedBox(height: 12,),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  border: Border.all(
                    width: 0.6,
                    color: Colors.black26
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 0.6,
                            color: Colors.black26
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    TextWidget.Text_14(text: "Master Card",fontWeight: FontWeight.w600),
                    Spacer(),
                    Image.asset(ImageConst.mastercard, height: 24, width: 24),
                    SizedBox(width: 20,),
                  ],
                ),
              ),
              SizedBox(height: 12,),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  border: Border.all(
                    width: 0.6,
                    color: Colors.black26
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20,),

                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 0.6,
                            color: Colors.black26
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    TextWidget.Text_14(text: "Visa Card",fontWeight: FontWeight.w600),
                    Spacer(),
                    Image.asset(ImageConst.visa, height: 24, width: 24),
                    SizedBox(width: 20,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MakePaymentScreen()));
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorConst.baseColor.withValues(alpha: 1.0),
                    borderRadius: BorderRadius.circular(45),
                    border: Border.all(
                      width: 0.6,
                      color: Colors.black26
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text("Place Order",style: TextStyle(color: Colors.white),)
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF1DB), // Light beige background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Left side: Item list
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildItem("Egg Stroganoff", ImageConst.netWorkImageTEst),
                const SizedBox(height: 12),
                buildItem("Chicken Alfred", ImageConst.netWorkImageTEst),
              ],
            ),
          ),

          // Vertical divider
          Container(
            width: 1,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            color: Colors.black26,
          ),

          // Right side: Price breakdown
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAmountRow(leftText: "Item total:", rightText: "AED 27.25"),
                SizedBox(height: 3,),
                customAmountRow(leftText: "VAT:", rightText: "0") ,
                SizedBox(height: 3,),

                customAmountRow(leftText: "Delivery Charge:", rightText: "0") ,
                const Divider(thickness: 0.6),
                rowText("Total:", "AED 27.25", isBold: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(String title, String imagePath) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(imagePath),
        ),

        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget.Text_12(text: title,fontWeight: FontWeight.w600),
            TextWidget.Text_12(text: "1x",fontWeight: FontWeight.w600),
          ],
        ),
      ],
    );
  }

  Widget rowText(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              )),
          Text(value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              )),
        ],
      ),
    );
  }
}
