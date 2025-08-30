import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart';
import '../../CustomWidget/LoadNetworkImage/load_network_image.dart';

class Circleitem extends StatelessWidget {
   Circleitem({super.key, required this.productModel});
  popularProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.white,
          height: 250,
          alignment: Alignment.topCenter,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 5),
                height: 240,
                width: 260,
                child: Padding(
                  padding: const EdgeInsets.all(1.5),
                  child: CircleAvatar(
                    radius: 115,
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              Positioned(
                top: -6,
                child: CircleAvatar(
                  radius: 117,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0,top: 5),
                    child: Container(
                      height: 210,
                      width: 210,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                       //   image: DecorationImage(image: NetworkImage(ImageConst.netWorkImageTEst),fit: BoxFit.fill)
                      ),
                      child:  ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(100),
                        child: netWorkImageCustom(
                            width: 210,
                            height: 210,
                            imageUrl: "${productModel.imageUrl}", heroTag: "heroTag3"),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
            bottom: 5,
            child: CircleAvatar(
          radius: 16,
          backgroundColor: ColorConst.baseColor,
          child: Text("12'", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
        )),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 -115,
            bottom: 60,
            child: CircleAvatar(
          radius: 16,
              backgroundColor: ColorConst.baseColor,
          child: Text("12'", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
        )),
        Positioned(
            left: MediaQuery.of(context).size.width / 2 + 85,
            bottom: 60,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: ColorConst.baseColor,
              child: Text("12'", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
            )),
      ],
    );
  }
}
