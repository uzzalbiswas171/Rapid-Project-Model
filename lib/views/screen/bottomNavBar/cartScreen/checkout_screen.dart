import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/ViewModels/Controller/CartOrderControlller/cart_order-controlller.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/CustomWidget/TextWigget/text_widget.dart';
import 'package:provider/provider.dart';
import 'PaymentMethod/payment_method.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
      double h= MediaQuery.of(context).size.height;
      double w= MediaQuery.of(context).size.width;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:   Text(
            "Check Out",
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
          actions: [
            Image.asset(ImageConst.shareImage, height: 24, width: 24, color: ColorConst.baseColor),
            SizedBox(width: 16,)
          ],
        ),
      body:SizedBox(
          height: h,
          width: w,
          child: Consumer<CartOrderProvider>(
            builder: (context, value, child) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ColorConst.baseColor.withValues(alpha: 0.2),
                    ),
                    padding: EdgeInsets.all(10),
                    child:  Row(
                        children: [
                          _widgetCenterColumn(
                              onTap: () {
                                Provider.of<CartOrderProvider>(context,listen: false).setSelectedButton(false);
                              },
                              t1: "Pick Up",t2: "10 min",c1:value.selectedButton==false? ColorConst.baseColor: ColorConst.baseColor.withValues(alpha: 0.0), c2: value.selectedButton==false?Colors.white : Colors.black),
                          SizedBox(width: 10,),
                          _widgetCenterColumn(
                              onTap: () {
                                Provider.of<CartOrderProvider>(context,listen: false).setSelectedButton(true);

                              },
                              t1: "Delivery",t2: "30-40 min",c1:value.selectedButton==false?ColorConst.baseColor.withValues(alpha: 0.0) :ColorConst.baseColor,
                              c2:value.selectedButton==false?Colors.black:Colors.white),
                        ],
                      ),
                    ),
                  value.selectedButton==true?Container(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16,),
                        TextWidget.Text_16(text: "Delivery Address:",fontWeight: FontWeight.w700),
                        SizedBox(height: 12,),
                        homeAddress(context: context),
                        SizedBox(height: 12,),
                        apertMentAddress(context),
                        SizedBox(
                          height: 16,
                        ),
                        TextWidget.Text_16(text: "Delivery Time:",fontWeight: FontWeight.w700,letterSpacing: -0.3),
                        SizedBox(
                          height: 5,
                        ),
                        TextWidget.Text_16(text: "11.00 AM",fontWeight: FontWeight.w600,letterSpacing: -0.3,color: Colors.black38),
                      ],
                    ),
                  ) :
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        ListTile(
                          leading: Image.asset(ImageConst.addressLocation,height: 18,width: 16,color: Colors.black,),
                          title: TextWidget.Text_16(text: "Pickup Address",fontWeight: FontWeight.w700,color: Colors.black,letterSpacing: 0.3),
                          subtitle: TextWidget.Text_14(text: "18/3 Arab Road, Tower level 5",fontWeight: FontWeight.w400,color: Colors.black54,letterSpacing: 0.3),
                        ),
                        ListTile(
                          leading: Image.asset(ImageConst.clock,height: 18,width: 18,color: Colors.black,),
                          title: TextWidget.Text_16(text: "Pickup Time",fontWeight: FontWeight.w700,color: Colors.black,letterSpacing: 0.3),
                          subtitle: TextWidget.Text_14(text: "10.15 AM",fontWeight: FontWeight.w400,color: Colors.black54,letterSpacing: 0.3),
                        ),
                        TextWidget.Text_20_600(text: "Contact Details"),
                        SizedBox(height: 7,),
                        textField(controller: controllerName,hinText: "Full Name"),
                        SizedBox(height: 7,),
                        textField(controller: controllerName,hinText: "Phone Number",keyboardType: TextInputType.number),
                        SizedBox(height: 7,),
                        textField(controller: controllerName,hinText: "Email"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConst.baseColor.withValues(alpha: 0.09),
                    ),
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      children: [
                        Image.asset(ImageConst.historyPer,height: 20,width: 20,color: Colors.black54,),
                        SizedBox(width: 10,),
                        TextWidget.Text_16(text: "Promo code",fontWeight: FontWeight.w400,color: Colors.black45,letterSpacing: -0.3),
                        Spacer(),
                        Container(
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: ColorConst.baseColor
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: TextWidget.Text_16(text: "Apply",fontWeight: FontWeight.w600,color: Colors.white,letterSpacing: -0.3),
                        ),
                      ],
                    ),
                  ),
               //   MediaQuery.of(context).size.height> 600?SizedBox(height: MediaQuery.of(context).size.height*0.1,):SizedBox(),
                  Spacer(),
                  CustomSubmitButton(text: "Place Order", onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethod(),));
                    // Handle order now action
                  },),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
      )

    );
  }
}


Widget textField({
  required TextEditingController controller,
  required String hinText,
  TextInputType? keyboardType=TextInputType.text,
}){
  return Container(
    height: 45,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey.shade50,
      border: Border(
        bottom: BorderSide(
          color: ColorConst.baseColor.withValues(alpha: 0.7),
          width: 1.0,
        ),
      ),
    ),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hinText,
          hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black26
          ),
          border: InputBorder.none
      ),
    ),
  );
}


Widget textFieldLabel({
  required TextEditingController controller,
  required String hinText,
  TextInputType? keyboardType=TextInputType.text,
}){
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey.shade50,
      border: Border(
        bottom: BorderSide(
          color: ColorConst.baseColor.withValues(alpha: 0.7),
          width: 1.0,
        ),
      ),
    ),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          label: Text(hinText,style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black26
          ),),
          // labelStyle: TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.w400,
          //     color: Colors.black26
          // ),
          border: InputBorder.none
      ),
    ),
  );
}


Widget textFieldAddress({
  required TextEditingController controller,
  required String hinText,
  TextInputType? keyboardType=TextInputType.text,
  int? m = 1,
  double ? h=45,
}){
  return Container(
    height: h,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey.shade50,
      border: Border(
        bottom: BorderSide(
          color: ColorConst.baseColor.withValues(alpha: 0.7),
          width: 1.0,
        ),
      ),
    ),
    child: TextFormField(
      maxLines: m,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hinText,
          hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black26
          ),
          border: InputBorder.none
      ),
    ),
  );
}







Widget homeAddress({
  required BuildContext context,
}){
  return Stack(
    children: [
      Container(
        height: 71,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.5,color: ColorConst.baseColor.withValues(alpha: 0.5),
          ),
        ),
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                value: true,
                onChanged: (value) {},
                activeColor: ColorConst.baseColor, // The color when checked
                checkColor: Colors.white,  // The check icon color
              ),
            ),
            SizedBox(width: 10,),
            SizedBox(
                height: 20,
                width: 20,
                child: Icon(Icons.home_outlined,size: 22,color: Colors.black.withValues(alpha: 0.7),)),
            SizedBox(width: 10,),
            Expanded(
                child: TextWidget.Text_14(text: "Road:09, House:121, Gulshan-1, Mayuri Housing, Dhaka",fontWeight: FontWeight.w400,letterSpacing: -0.3)
            ),
            SizedBox(width: 16,),
          ],
        ),
      ),
      Positioned(
          right: 10,
          top: 10,
          child: Image.asset(ImageConst.editIcon,height: 18,width: 18,color: Colors.black87,))
    ],
  );
}


Widget _widgetCenterColumn({
  required String t1,
  required String t2,
  required Color c1,
  required Color c2,
  required GestureTapCallback? onTap,
}){
  return   Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: c1,
            ),
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget.Text_16(text: t1,fontWeight: FontWeight.w600,color:c2,letterSpacing: 0.3),
          TextWidget.Text_12(text: t2,fontWeight: FontWeight.w400,color: c2.withValues(alpha: 0.7),letterSpacing: 0.3),
        ],
            ),
          ),
      ));
}

Widget apertMentAddress(BuildContext context){
  return Container(
    height: 71,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        width: 0.5,color: Colors.black.withValues(alpha: 0.4),
      ),
    ),
    padding: EdgeInsets.only(left: 10,right: 10),
    child: Row(
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: Checkbox(
            value: false,
            onChanged: (value) {},
            activeColor: ColorConst.baseColor, // The color when checked
            checkColor: Colors.white,  // The check icon color
          ),
        ),
        SizedBox(width: 10,),
        SizedBox(
            height: 18,
            width: 18,
            child: Image.asset(ImageConst.apartment,fit: BoxFit.fill,height: 16,width: 16,)),
        SizedBox(width: 10,),
        Expanded(child: TextWidget.Text_14(text: "Road:09, House:121, Gulshan-1, Mayuri Housing, Dhaka",fontWeight: FontWeight.w400,letterSpacing: -0.3)),
        SizedBox(width: 16,),

      ],
    ),
  );
}