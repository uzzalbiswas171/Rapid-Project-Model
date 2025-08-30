import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Views/Screen/Auth/LoginScreen/login_screen.dart';



class MainSplashScreen extends StatelessWidget {
  const MainSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background food images (simulated with a placeholder image or a pattern)
          // For a real app, this would be a custom painter, multiple images, or a patterned asset.
          // Here, a semi-transparent white helps simulate the overlay effect over potential background images.

          // Fallback if the background asset isn't present or for a simpler look
          Container(
            color: Colors.white.withOpacity(0.7), // Semi-transparent white overlay
          ),

          Positioned(
            right: -55,
            top: -55,
            child: ClipOval(
              child: Container(
                width: MediaQuery.of(context).size.width * 1.05, // Adjust size as needed
                height: MediaQuery.of(context).size.width * 1.05, // Make it a perfect circle
                color: ColorConst.baseColor, // Orange background for the circle
                child: Padding(
                  padding: const EdgeInsets.only(top: 35.0,right: 35),
                  child: Center(
                    child: Image.asset(
                      ImageConst.splash_two_top_corner, // Replace with your actual food image asset
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.68, // Image slightly smaller than circle
                      height: MediaQuery.of(context).size.width * 0.68,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section: Circular Image

              SizedBox(height: MediaQuery.of(context).size.width * 0.95,), // Space between image and text

              // Bottom Section: Text and Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey!',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: ColorConst.baseColor, // Darker orange for "Hey!"
                      ),
                    ),
                    Text(
                      'Excellency',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: ColorConst.baseColor, // Darker orange for "Excellency"
                      ),
                    ),
                    const SizedBox(height: 10.0),
                     Text(
                      "Let’s find your favorite food.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight:FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.baseColor, // Button background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0), // Rounded corners
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        elevation: 5,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min, // Make row take minimum space
                        children: [
                          Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}