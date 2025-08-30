

import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart' show ImageConst;
import 'package:rapid_super_market/Core/HttpApis/refreshItem.dart';
import 'package:rapid_super_market/Core/HttpFunctions/http_functions_auth.dart';
import 'package:rapid_super_market/Core/LocalDataBase/SharePref/share_prefrence.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomWidgetTextField/custom_Email_Text_Field.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomWidgetTextField/custom_password_text_field.dart';
import 'package:rapid_super_market/Views/Screen/Auth/LoginScreen/login_screen.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conPasswordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  void f(){}

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _conPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
  void handleRegister() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    final response = await HttpFunctionsAuth.registerUser(
      name: _nameController.text.toString(),
      email: _emailController.text.toString(),
      password: _passwordController.text.toString(),
    );
    setState(() {
      _isLoading = false;
    });
    if (response.success) {
      print('✅ Welcome ${response.user?.fullName}');
      print('🪪 Token: ${response.token}');
      PrefsHelper.setToken("${response.token}");
      PrefsHelper.setUserName("${response.user!.fullName}");
      PrefsHelper.setUserPhoto("${response.user!.imageUrl}");
      PrefsHelper.setUserCustomerId("${response.user!.customerId}");
      PrefsHelper.setUserCustomerEmail("${response.user!.email}");
      PrefsHelper.setUserId("${response.user!.id}");
      RefreshProviderFunctions.homeCheckInternetGetData(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => CustomBottomNavBar(),));
    } else {
      setState(() {
        _errorMessage = response.message;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_errorMessage!)));
      });
    }
  }
  // Future<void> saveToken(String token) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('auth_token', token);
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final circleRadius = screenWidth * 0.3; // 30% of screen width
    final imageSize = circleRadius * 1.2;
    return Scaffold(
      backgroundColor: Colors.white, // Assuming white background for the card/screen
      body: Card(
        margin: EdgeInsets.all(0),
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: -95,
                    left: -35,
                    child: Transform.rotate(
                      angle: -0.2,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.6, // ~40% of screen height
                        width: MediaQuery.of(context).size.width+30,
                        decoration: BoxDecoration(
                          color: ColorConst.baseColor.withValues(alpha: 0.5),

                          shape: BoxShape.circle,
                        ),
                        padding:EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.09, // 5% of screen height
                        ),
                        child: Center(
                          child: CircleAvatar(
                            radius: circleRadius,
                            backgroundColor: ColorConst.baseColor.withValues(alpha: 0.0),
                            child: ClipOval(
                              child: Image.asset(
                                ImageConst.logo,
                                width: imageSize,
                                height: imageSize,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -70,
                    left: -35-5,
                    child: Transform.rotate(
                      angle: -0.2,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.56, // ~40% of screen height
                        width: MediaQuery.of(context).size.width+17,
                        decoration: BoxDecoration(
                          color: ColorConst.baseColor, // 0.5 alpha
                          shape: BoxShape.circle,
                        ),
                        padding:EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.09, // 5% of screen height
                        ),
                        child: Center(
                          child: CircleAvatar(
                            radius: circleRadius,
                            backgroundColor: ColorConst.baseColor.withValues(alpha: 0.0),
                            child: ClipOval(
                              child: Image.asset(
                                ImageConst.logo,
                                width: imageSize,
                                height: imageSize,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    left: -20-5,
                    child: Transform.rotate(
                      angle: -0.2,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.55, // ~40% of screen height
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: ColorConst.baseColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(MediaQuery.of(context).size.width * 0.8), // 15% of width
                            bottomRight: Radius.circular(MediaQuery.of(context).size.width * 1.3),
                            topRight: Radius.circular(MediaQuery.of(context).size.width * 1.0),
                          ),
                        ),
                        padding:EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.06, // 5% of screen height
                        ),
                        child: Center(
                          child: CircleAvatar(
                            radius: circleRadius,
                            backgroundColor: ColorConst.baseColor.withValues(alpha: 0.0),
                            child: ClipOval(
                              child: Transform.rotate(
                                angle: 0.2,
                                child: Image.asset(
                                  ImageConst.logo,
                                  width: imageSize,
                                  height: imageSize,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.335,),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withValues(alpha: 0.9)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Log In title
                              Center(
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                  
                              const SizedBox(height: 30),
                  
                              // Name Field
                              CustomEmailField(controller: _nameController, labelText: "Full Name",),
                              const SizedBox(height: 12),
                  
                              // Email Address Field
                              CustomEmailField(controller: _emailController),
                              const SizedBox(height: 12),
                  
                              // Password
                              CustomPasswordField(controller: _passwordController),
                              const SizedBox(height: 12),
                  
                              // Confirm Password
                              CustomPasswordField(controller: _conPasswordController,labelText: "Confirm Password",),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "have an account? ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // TODO: Navigate to Signup screen
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                                      print('Signup tapped!');
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: ColorConst.baseColor.withValues(alpha: 0.7),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              // Login Button
                              CustomSubmitButton(text: _isLoading? "Sign up processing...":"Sign up", onPressed: () {
                              //  Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerificationScreen(emailAddress: "",),));
                                if(_nameController.text.isEmpty){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Name is required")));
                                }else if(_emailController.text.isEmpty){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email is required")));
                                }else if(_passwordController.text.isEmpty){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password is required")));
                                }else if(_conPasswordController.text.isEmpty){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Confirm password is required")));
                                }else if(_passwordController.text==_conPasswordController.text){
                                  if(_passwordController.text.length>6){
                                    _isLoading
                                        ?f():
                                    handleRegister();
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password length must be 6")));
                                  }
//                                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerificationScreen(signUpMail: _emailController.text,),));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password doesn't match")));
                                }
                              },),
                              const SizedBox(height: 12),
                              // Don't have an account? Signup
                  
                            ],
                          ),
                        ),
                      ),
                  
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

