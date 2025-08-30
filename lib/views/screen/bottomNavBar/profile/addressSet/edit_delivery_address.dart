import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/CustomWidget/TextWigget/text_widget.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/CartScreen/checkout_screen.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/Profile/AddressSet/new_address_with_google_map.dart';

class EditDeliveryAddress extends StatefulWidget {
  const EditDeliveryAddress({super.key});

  @override
  State<EditDeliveryAddress> createState() => _EditDeliveryAddressState();
}

class _EditDeliveryAddressState extends State<EditDeliveryAddress> {
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController addressLineOneController=TextEditingController();
  TextEditingController addressLineTwoController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Delivery Address",
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    textField(controller: nameController,hinText: "Full Name"),
                    SizedBox(height: 10,),
                    textField(controller: phoneController,hinText: "Phone",keyboardType: TextInputType.phone),
                    SizedBox(height: 10,),
                    textFieldAddress(controller: addressLineOneController,m: 3,h: 100,hinText: "Address Line 1",keyboardType: TextInputType.phone),
                    SizedBox(height: 10,),
                    textFieldAddress(controller: addressLineTwoController,m: 3,h: 100, hinText: "Address Line 2",keyboardType: TextInputType.phone),
                    const SizedBox(height: 16),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 20,width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1,
                                    color: ColorConst.baseColor
                                )
                            ),
                            padding: EdgeInsets.all(3),
                            child: CircleAvatar(
                              backgroundColor: ColorConst.baseColor,
                            ),
                          ),
                          SizedBox(width: 10,),
                          TextWidget.Text_14(text: "Make Default Shipping Address",fontWeight: FontWeight.w400,letterSpacing: 0.1)
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
              CustomSubmitButton(text: "Save Address", onPressed: () {

              },),
              SizedBox(height: 16,),
              CustomSubmitButton(
                borderColor: ColorConst.baseColor.withValues(alpha: 0.5),
                backgroundColor: Colors.white,
                textColor: Colors.black87,
                text: "Locate Me", onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewAddressWithGoogleMapScreen(),));
              },),
              SizedBox(height: 30,)

            ],
          ),
        ),
      ),
    );
  }
}
