import 'package:flutter/material.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/CustomWidget/TextWigget/text_widget.dart';
import '../../CartScreen/checkout_screen.dart';

class NewAddressWithGoogleMapScreen extends StatefulWidget {
  const NewAddressWithGoogleMapScreen({super.key});

  @override
  State<NewAddressWithGoogleMapScreen> createState() => _NewAddressWithGoogleMapScreenState();
}

class _NewAddressWithGoogleMapScreenState extends State<NewAddressWithGoogleMapScreen> {
  TextEditingController locationController=TextEditingController();
  @override
  void initState() {
    locationController.text="3263 Godfrey Road";
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "New Address",
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
        child: Column(
          children: [
            Expanded(child: Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              child:Text("Google ma is loading...")
            ),),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
              margin: EdgeInsets.only(left: 16,right: 16),
              decoration: BoxDecoration(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),color: Colors.grey.withValues(alpha: 0.2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget.Text_16(text: "Your Location",),
                  SizedBox(height: 10,),
                  textField(controller: locationController,hinText: "Full Name"),
                  SizedBox(height: 10,),
                  CustomSubmitButton(text: "Confirm Location", onPressed: () {

                  },),
                  SizedBox(height: 10,),
                  Center(child: TextWidget.Text_16(text: "Or",letterSpacing: -0.3,fontWeight: FontWeight.w700)),
                  SizedBox(height: 10,),
                  Container(
                   height: 45,
                   width: double.infinity,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(45),
                   border: Border.all(width: 1,color: Colors.grey.withValues(alpha: 0.5),)
                   ),
                   alignment: Alignment.center,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Icon(Icons.my_location,size: 17,),
                       SizedBox(width: 10,),
                       TextWidget.Text_18_600(text: "Use Current Location",fontWeight: FontWeight.w700,letterSpacing: -0.3),
                     ],
                   ),
                 ),

                ],
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
