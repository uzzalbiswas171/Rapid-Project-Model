
import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart' show ColorConst;

// Assuming ImageConst is a class where you define your image paths
// For example:


class SocialLoginButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? borderColor;
  final double height;
  final double borderRadius;
  final double iconSize;
  final double fontSize;
  final double iconTextSpacing;
  final FontWeight? fontWeight;

  const SocialLoginButton({
    super.key,
    required this.iconPath,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.black87,
    this.borderColor, // Defaults to grey.shade300 if null in the button style
    this.height = 40.0, // Default height
    this.borderRadius = 50.0, // Default border radius for a pill shape
    this.iconSize = 24.0, // Default icon size
    this.fontSize = 14.0, // Default font size
    this.iconTextSpacing = 8.0, // Default spacing
    this.fontWeight= FontWeight.w700
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          // Calculate vertical padding to center content vertically within the fixed height
          // This is a bit of a manual calculation based on text and icon size
          // A more robust solution for perfect centering might involve custom layout
          // For a 40px height, 20px icon, 15px text, and 1.5px border,
          // (40 - (20 + some_text_height))/2 = approx vertical padding.
          // Let's use a small fixed value and rely on SizedBox to enforce overall height.
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Horizontal padding
          side: BorderSide(
            color: borderColor ?? Colors.grey.shade300,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Make the row take minimum width
          children: <Widget>[
            Image.asset(
              iconPath,
              height: iconSize,
              width: iconSize,
            ),
            SizedBox(width: iconTextSpacing),
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class CustomSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor; // Default text color
  final double borderRadius;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final double height;

  const CustomSubmitButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = ColorConst.baseColor, // Orange[700]
    this.borderColor = ColorConst.baseColor, // Orange[700]
    this.textColor = Colors.white, // Orange[700]
    this.borderRadius = 45.0, // Rounded corners
    this.fontSize = 18.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.height = 40.0, // Fixed height
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding,
          minimumSize: Size.fromHeight(height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: borderColor, // 🔴 Set your border color here
              width: 1,          // Optional: set border width
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}


class CustomSubmitButtonLeftImage extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor; // Default text color
  final double borderRadius;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final double height;

  const CustomSubmitButtonLeftImage({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = ColorConst.baseColor, // Orange[700]
    this.borderColor = ColorConst.baseColor, // Orange[700]
    this.textColor = Colors.white, // Orange[700]
    this.borderRadius = 45.0, // Rounded corners
    this.fontSize = 18.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.height = 40.0, // Fixed height
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding,
          minimumSize: Size.fromHeight(height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: borderColor, // 🔴 Set your border color here
              width: 1,          // Optional: set border width
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}