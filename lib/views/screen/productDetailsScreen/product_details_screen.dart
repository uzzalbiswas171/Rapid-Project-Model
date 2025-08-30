import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart';
import 'package:rapid_super_market/Views/Screen/ProductDetailsScreen/circleItem.dart';
import 'package:rapid_super_market/Views/Screen/ProductDetailsScreen/details_heading_part.dart';
import 'package:rapid_super_market/Views/Screen/ProductDetailsScreen/rating_part.dart';

class ProductDetailsScreen extends StatefulWidget {
    ProductDetailsScreen({super.key, required this.productModel});
    popularProductModel productModel;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double h= MediaQuery.of(context).size.height;
    double w= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:   Text(
          "Details",
          style: const TextStyle(
            fontSize: 18, // Slightly larger title
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black87,size: 20,)),
        actions: [
          Image.asset(ImageConst.shareImage, height: 24, width: 24, color: ColorConst.baseColor),
          SizedBox(width: 16,)
        ],
      ),
      body: Container(
        height: h,
        width: w,
        color: Color(0xffFFF0D5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Circleitem(productModel: widget.productModel,),
              HeadingPartDetailsScreen(productModel: widget.productModel,),
              widget.productModel.description != "null"?  SizedBox(height: 24,):SizedBox(),
              widget.productModel.description != "null"?  Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16),
                child: Text("${widget.productModel.description}",style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black38
                ),),
              ):SizedBox(),
              SizedBox(height: 15,),
              RatingPart(),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.only(left: 15),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.7,
                    color: Colors.black87
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.black, size: 20,),
                    SizedBox(width: 10,),
                    Text("See Allergen Information",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      letterSpacing: -0.1
                    ),),
                    Spacer(),
                    IconButton(onPressed: () {
          
                    }, icon: Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 18,)),
                  ],
                ),
              ),
               SizedBox(height: 25,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ingredients",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        letterSpacing: -0.1
                    ),),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            height: 80,
                            width:  60,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 20,
                                      child: Image.asset(ImageConst.clock,fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1),
                                Text("Salt",style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black38
                                  ),),
                              ],
                            ),
                          );
                        }
                      ),
                    ),

                    SizedBox(
                      height: 18,
                    ),
                    Text("Recommended Foods",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        letterSpacing: -0.1
                    ),),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 60,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  ListTile(
                                  //  Contentpadding: EdgeInsets.only(left: 0, right: 0),
                                    leading: CircleAvatar(radius: 20,child: Image.network(ImageConst.netWorkImageTEst,fit: BoxFit.fill,),),
                                    title: Text("Barger",style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87
                                    ),),
                                    trailing: Checkbox(value: false, onChanged: (value) {

                                    },),
                                  ),
                                 index==5?SizedBox(): Divider(
                                    height: 1,
                                    color: Colors.black12,
                                  )
                                ],
                              ),
                            );
                          }
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              )
          
          
            ],
          ),
        ),
      ),
    );
  }
}
