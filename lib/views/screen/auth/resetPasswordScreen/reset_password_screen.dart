import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomWidgetTextField/custom_password_text_field.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/bottom_nav_bar.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conPasswordController = TextEditingController();
  // bool _isPasswordVisible = false;
  // bool _isConPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                  )
                ],
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).size.height * 0.464-107,
              left: 20,
              right: 20,
              child: SizedBox(
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
                        Center(
                          child: const Text(
                            'Reset Password',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: const Text(
                            'Your new password must be different from previous used passwords',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black87),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Email Address Field
                        CustomPasswordField(controller: _passwordController,labelText: "Enter New Password",),
                        const SizedBox(height: 16),
                        CustomPasswordField(controller: _conPasswordController,labelText: "Confirm Password",),
                        const SizedBox(height: 25),

                        // Login Button
                        CustomSubmitButton(text: "Submit", onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CustomBottomNavBar(),));
                        },),
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
