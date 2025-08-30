import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart' show popularProductModel;
import 'package:rapid_super_market/ViewModels/Controller/AddToCartController/add_to_cart_controller.dart' show AddToCartProvider;
import 'package:provider/provider.dart';
import '../../CustomWidget/CustomButton/custom_button.dart';

class HeadingPartDetailsScreen extends StatefulWidget {
  HeadingPartDetailsScreen({super.key, required this.productModel});

  popularProductModel productModel;

  @override
  State<HeadingPartDetailsScreen> createState() =>
      _HeadingPartDetailsScreenState();
}

class _HeadingPartDetailsScreenState extends State<HeadingPartDetailsScreen> {
  int countItem = 0;

  @override
  Widget build(BuildContext context) {
    List<popularProductModel> addToCartList=Provider.of<AddToCartProvider>(context).addToCartList;
    bool isGet = addToCartList.any((item) => item.id == widget.productModel.id);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 55, left: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.productModel.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "AED ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text(
                        " ${widget.productModel.finalPrice}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Text(
                "210 kcal",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
        ),
        Positioned(
          top: -1,
          child: Image.asset(
            ImageConst.curveVector,
            height: 65,
            width: 200,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          child: Container(
            width: 150,
            height: 50,
            alignment: Alignment.center,
            child: Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                      if(countItem >1)
                        Provider.of<AddToCartProvider>(context,listen: false).updateIdWiseDataAddToCartList("${widget.productModel.id}", 'qty', "${countItem--}");
                      else{
                        Provider.of<AddToCartProvider>(context,listen: false).updateIdWiseDataAddToCartList("${widget.productModel.id}", 'qty', "${countItem++}");
                      }

                  },
                  child: Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.remove, size: 16, color: Colors.black),
                  ),
                ),
                Spacer(),
                Text("$countItem"),
                Spacer(),
                GestureDetector(
                  onTap:()=> setState(() { countItem++;}),
                  child: Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ColorConst.baseColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.add, size: 16, color: Colors.white),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        Positioned(
          right: 15,
          top: 10,
          child: SizedBox(
            width: 140,
            child: CustomSubmitButton(text: isGet? "Cart Added" :"Add to Cart", onPressed: () {
              Provider.of<AddToCartProvider>(context,listen: false).insertDataAddToCartList(widget.productModel);
            }),
          ),
        ),
      ],
    );
  }
}
