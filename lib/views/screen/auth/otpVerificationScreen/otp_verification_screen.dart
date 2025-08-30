import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  OtpVerificationScreen({super.key, required this.emailAddress});
  String emailAddress;
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController _otpController = TextEditingController();

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
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: -110-45,
                    left: -40-20,
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
                    top: -90-45,
                    left: -45-20,
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
                    top: -70-45,
                    left: -35-20,
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
                          bottom: MediaQuery.of(context).size.height * 0.01, // 5% of screen height
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.464 -230,
                    child: Image.asset(
                    ImageConst.otpVerification,
                      width:  MediaQuery.of(context).size.width  * 0.53,
                      height: MediaQuery.of(context).size.height * 0.25,
                    fit: BoxFit.fill,
                  ),)
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.464 -40,
              left: 20,
              right: 20,
              child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        const Text(
                          'OTP Verification',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Enter the verification code we just sent to your email\nxxxxx@stringconsultants.com',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 25),

                        // OTP Input
                        PinCodeTextField(
                          controller: _otpController,
                          appContext: context,
                          length: 6,
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline, // Underline only
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeColor: ColorConst.baseColor,         // Active bottom line
                            inactiveColor: Colors.grey,  // Inactive bottom line
                            selectedColor: ColorConst.baseColor,        // When selected
                            activeFillColor: Colors.transparent, // No background
                            inactiveFillColor: Colors.transparent,
                            selectedFillColor: Colors.transparent,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true, // No box fill
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 0),
                        // Resend text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Didn't receive code? ",style: TextStyle(fontWeight: FontWeight.w500,
                                color:Colors.black54),),
                            GestureDetector(
                              onTap: () {
                                // TODO: Implement resend logic
                              },
                              child: Text(
                                'Resend',
                                style: TextStyle(
                                  color: ColorConst.baseColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        // Verify Button
                        CustomSubmitButton(text: "Verify", onPressed: () {

                        },)
                      ],
                    ),
              ),
            ),
            Positioned(
                top: 35,
                left: 20,
                child: Card(
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 30,
                  width: 30,
                  color: ColorConst.baseColor,
                  child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 15,),
                ),
              ),
            ))
          ],
        ),
      ),
    );
    // final themeColor = ColorConst.baseColor.shade600;
    //
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: Container(
    //     height: double.infinity,
    //     width: double.infinity,
    //     padding: const EdgeInsets.symmetric(horizontal: 24.0),

    //   ),
    // );
  }
}
