import 'package:flutter/material.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/CartScreen/checkout_screen.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _prevPassWordController=TextEditingController();
  final TextEditingController _newPassWordController=TextEditingController();
  final TextEditingController _conPassWordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Change Password",
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
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              textFieldLabel(controller: _prevPassWordController,hinText: "Enter previous Password"),
              SizedBox(height: 10,),
              textFieldLabel(controller: _newPassWordController,hinText: "Enter New Password"),
              SizedBox(height: 10,),
              textFieldLabel(controller: _conPassWordController,hinText: "Confirm Password"),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      bottomSheet:  Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 40),
        child: CustomSubmitButton(text: "Change Password", onPressed: () {

        },),
      ),
    );
  }
}
