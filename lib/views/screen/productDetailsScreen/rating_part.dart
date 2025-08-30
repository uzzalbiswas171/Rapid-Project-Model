
import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';

class RatingPart extends StatefulWidget {
  const RatingPart({super.key});

  @override
  State<RatingPart> createState() => _RatingPartState();
}

class _RatingPartState extends State<RatingPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 45,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 52,
            child: Row(
              children: [
                Image.asset(ImageConst.star, height: 20, width: 20, color: ColorConst.baseColor),
                SizedBox(width: 7,),
                Text("5.0",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87
                ),)
              ],
            ),
          ),
          Container(
            height: 20,
            width: 2,
            color: Colors.black12,
          ),
          Container(
            height: 52,
            child: Row(
              children: [
                Image.asset(ImageConst.delivery, height: 20, width: 20, color: ColorConst.baseColor),
                SizedBox(width: 7,),
                Text("5.0",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87
                ),)
              ],
            ),
          ),
          Container(
            height: 20,
            width: 2,
            color: Colors.black12,
          ),
          Container(
            height: 52,
            child: Row(
              children: [
                Image.asset(ImageConst.clock, height: 20, width: 20, color: ColorConst.baseColor),
                SizedBox(width: 7,),
                Text("50 m",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
