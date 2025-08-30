

import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart' show ImageConst;
import 'package:rapid_super_market/Core/HttpApis/refreshItem.dart';
import 'package:rapid_super_market/Core/HttpFunctions/http_functions_auth.dart';
import 'package:rapid_super_market/Core/LocalDataBase/SharePref/share_prefrence.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomWidgetTextField/custom_Email_Text_Field.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomWidgetTextField/custom_password_text_field.dart';
import 'package:rapid_super_market/Views/Screen/Auth/ForgetPasswordScreen/forget_password_screen.dart';
import 'package:rapid_super_market/Views/Screen/Auth/SignUpScreen/sign_up_screen.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  void f(){}
  void _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final response = await HttpFunctionsAuth.login(
      _emailController.text.trim(),
      _passwordController.text.trim(),
      context
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
      // Navigate to home/dashboard
    } else {
      setState(() {
        _errorMessage = response.message;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_errorMessage!)));
      });
    }
  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final circleRadius = screenWidth * 0.25; // 30% of screen width
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
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.464, // ~40% of screen height
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: ColorConst.baseColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(MediaQuery.of(context).size.width * 0.2), // 15% of width
                        bottomRight: Radius.circular(MediaQuery.of(context).size.width * 0.2),
                      ),
                    ),
                    padding:EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.12, // 5% of screen height
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
                  )
                ],
              ),
            ),

            Positioned(
              bottom: 60,
              left: 20,
              right: 20,
              child: SizedBox(
                height: 480,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withValues(alpha: 0.9)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // Log In title
                        Text(
                          'Log In',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Log in to your account subtitle
                        Text(
                          'Log in to your account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        const SizedBox(height: 20),
        
                        // Email Address Field
                        CustomEmailField(controller: _emailController),
                        const SizedBox(height: 12),
        
                        // Password Field
                        CustomPasswordField(controller: _passwordController),
                        const SizedBox(height: 12),
        
                        // Forgot password?
                        customForgetPassword(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordScreen(),));
                        },),
                        const SizedBox(height: 20),
        
                        // Login Button
                        CustomSubmitButton(text:_isLoading?"Login Processing" : "Login", onPressed:(){
                          _isLoading
                          ?f(): _login();
                        }),
                        const SizedBox(height: 12),
        
                        // Login with your social account
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Login with your social account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
        
                        // Login with Google Button
                        SocialLoginButton(iconPath: ImageConst.googleAuthIcon, text: "Login with Google", onPressed: () {

                        },),
                        const SizedBox(height: 15),

                        // Login with Apple Button
                        SocialLoginButton(iconPath: ImageConst.appleAuthIcon, text: "Login with Apple", onPressed: () {

                        },),
                        const SizedBox(height: 15),
        
                        // Don't have an account? Signup
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[700],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // TODO: Navigate to Signup screen
                               Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                              },
                              child: Text(
                                'Signup',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: ColorConst.baseColor.withValues(alpha: 0.7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

Widget customForgetPassword ( final GestureTapCallback? onTap  ){
  return Align(
    alignment: Alignment.centerLeft,
    child: GestureDetector(
      onTap: onTap,
      child: Text(
        'Forgot password?',
        style: TextStyle(
          color: ColorConst.baseColor.withValues(alpha: 0.7),
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}