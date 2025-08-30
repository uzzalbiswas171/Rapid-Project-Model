import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/ViewModels/Controller/AddToCartController/add_to_cart_controller.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/CustomWidget/LoadNetworkImage/load_network_image.dart';
import 'package:rapid_super_market/Views/CustomWidget/TextWigget/text_widget.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/CartScreen/checkout_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    Provider.of<AddToCartProvider>(context,listen: false).loadAddToCartList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AddToCartProvider>(context,listen: false).getTotalAmount();
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final cartList=Provider.of<AddToCartProvider>(context).addToCartList;
    final cartProvider=Provider.of<AddToCartProvider>(context);
   double h= MediaQuery.of(context).size.height;
   double w= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:   Text(
          "Cart",
          style: const TextStyle(
            fontSize: 18, // Slightly larger title
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        // leading: IconButton(onPressed: () {
        //   Navigator.pop(context);
        // }, icon: Icon(Icons.arrow_back_ios,color: Colors.black87,size: 20,)),
        actions: [
          Image.asset(ImageConst.shareImage, height: 24, width: 24, color: ColorConst.baseColor),
          SizedBox(width: 16,)
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cartList.length,
                itemBuilder: (context, index){
                  return Container(
                margin: EdgeInsets.only(
                  bottom: 10
                ),
                padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConst.baseColor.withValues(alpha: 0.1),
                ),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius:BorderRadiusGeometry.circular(5),
                          child:netWorkImageCustom(imageUrl: "${cartList[index].imageUrl}",
                              height: 70,width: 70,heroTag: "imgHero5" )),
                      SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget.Text_16(text: "${cartList[index].name}", fontWeight: FontWeight.w700),
                              TextWidget.Text_16(text: "${priceCalculationController('${cartList[index].qty}', '${cartList[index].finalPrice}')}", fontWeight: FontWeight.w700,
                                color: ColorConst.baseColor),
                            ],
                          ),
                        ),
                      SizedBox(width: 10,),
                      countButton(() {
                        if(int.parse('${cartList[index].qty}') >1)
                        Provider.of<AddToCartProvider>(context,listen: false).updateIdWiseDataAddToCartList("${cartList[index].id}", 'qty', "${int.parse('${cartList[index].qty}')-1 }");
                      }, Icons.remove, ColorConst.baseColor.withValues(alpha: 0.5),Colors.black),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextWidget.Text_12(text: "${cartList[index].qty}",fontWeight: FontWeight.w600),
                      ),
                      countButton(() {
                        Provider.of<AddToCartProvider>(context,listen: false).updateIdWiseDataAddToCartList("${cartList[index].id}", 'qty', "${int.parse('${cartList[index].qty}')+1 }");
                      }, Icons.add, ColorConst.baseColor.withValues(alpha: 0.5),Colors.white),
                      SizedBox(width: 10,),
                      GestureDetector(
                          onTap: () {
                            Provider.of<AddToCartProvider>(context,listen: false).clearIdWiseDataAddToCartList("${cartList[index].id}");
                          },
                          child: Image.asset(ImageConst.deleteIcon, height: 16, width: 16, color: Colors.black87)),

                        //  child: Image.network(ImageConst.netWorkImageTEst, height: 70, width: 70, fit: BoxFit.fill)),
                    ],
                  ),
              );}),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
              decoration: BoxDecoration(
                color: ColorConst.baseColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       customAmountRow(leftText: "Item total:", rightText: "AED ${cartProvider.totalAmount}"),
                       SizedBox(height: 3,),
                       customAmountRow(leftText: "Service Charge:", rightText: "0"),
                       SizedBox(height: 3,),
                       customAmountRow(leftText: "Delivery Charge:", rightText: "0"),
                     ],
                   ),
                 ),
                  Divider(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10,top: 5,bottom: 5),
                    child: Row(
                      children: [
                        TextWidget.Text_16(text: "Total",fontWeight: FontWeight.w700),
                        Spacer(),
                        TextWidget.Text_16(text: "${cartProvider.totalAmount}",fontWeight: FontWeight.w700),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomSubmitButton(text: "Check Out", onPressed: () {
                      debugPrint("Checkout Pressed");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen(),));
                    },),
                  )
                ],
              ),
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),



    );
  }
}




Widget countButton( final GestureTapCallback? onTap ,final IconData? icon , Color color,  Color T_color ) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 18,width: 18,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 0.5,
          color: ColorConst.baseColor.withValues(alpha: 0.5),
        ),
      ),
      alignment: Alignment.center,
      child: Icon(icon, color: T_color, size: 16, ),
    ),
  );
}



Widget customAmountRow({
  required String leftText,
  required String rightText,
}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextWidget.Text_14(text: leftText, color: Colors.black54,
          fontWeight: FontWeight.w400,letterSpacing: -0.1),
      Spacer(),
      TextWidget.Text_14(text: rightText, color: Colors.black54,
          fontWeight: FontWeight.w400,letterSpacing: -0.1),
    ],
  );
}




