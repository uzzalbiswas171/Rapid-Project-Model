import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/ViewModels/Controller/PopularController/popular_controller.dart';
import 'package:rapid_super_market/Views/CustomWidget/FoodGrtidCard/food_grid_card.dart';
import 'package:rapid_super_market/Views/CustomWidget/HomeWidget/home_widget.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/HomeScreen/home_screen.dart';
import 'package:rapid_super_market/Views/Screen/ProductDetailsScreen/product_details_screen.dart';
import 'package:provider/provider.dart';

class PopularScreen extends StatefulWidget {
   PopularScreen({super.key,required this.ItemList,required this.TitleName});
  final ItemList;
  String TitleName;
  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  Widget build(BuildContext context) {
    final popularProductShorting = Provider.of<PopularProvider>(context);
    if (kDebugMode) {
      print("object==lllllllllll=====> ${widget.ItemList.length}");
    }
    return Scaffold(
     body:  Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16,right: 16),
                  height: 250,
                  width: double.infinity,
                  color: ColorConst.baseColor.withValues(alpha: 0.5),
                ),
                Spacer(),
              ],
            ),
          ),
          Positioned(
            top: 40,
            child:SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 20,right: 10),
                leading: IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_ios,color: Colors.black87,size: 20,)),
                title:   Row(
                  children: [

                    Text(
                      "${widget.TitleName} ",
                      style: const TextStyle(
                        fontSize: 18, // Slightly larger title
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 50,
                          child: Icon(Icons.shopping_cart_outlined,size: 22,color: Colors.black,),
                        ),
                        Positioned(
                            top: 0,
                            left: 5,
                            child: CircleAvatar(radius: 9,backgroundColor: ColorConst.baseColor,child: Text("31",style: TextStyle(letterSpacing: -0.3,fontSize: 9,color: Colors.white),),))
                      ],
                    ),
                    SizedBox(width: 10,),
                  ],
                ),

              ),

            ),

          ),

          popularProductShorting.popularItemsShort== false?
          Positioned(
              bottom: 0,
              left: 16,
              right: 16,
              child: Container(
                height: MediaQuery.of(context).size.height-150,
                width: double.infinity,
                color: Colors.red.withValues(alpha: 0.0),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(// Disable GridView's own scrolling
                    itemCount: widget.ItemList.length,
                    itemBuilder: (context, index) {
                      final item=widget.ItemList[index];
                      return popularListCardWidget(item: item, index: index);
                    },
                  ),
                ),
              )):
          Positioned(
              bottom: 0,
              left: 16,
              right: 16,
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                height: MediaQuery.of(context).size.height-170,
                width: double.infinity,
                color: Colors.red.withValues(alpha: 0.0),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child:GridView.builder(
                  //  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 160
                    ), itemCount: widget.ItemList.length,itemBuilder: (context, index) {
                    final items=widget.ItemList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(productModel: items),));
                      },
                      child: FoodGridCard(
                        foodItem: items,
                        id: "${items.id}",
                        imageUrl: '${items.imageUrl}', // Placeholder image
                        title: '${items.name}',
                        subtitle: items.description=="null"?"Description : ":'${items.description??""}',
                        price: double.parse("${items.finalPrice}"),
                        rating:double.parse("${items.code}"),
                      ),
                    );
                  },),
                ),
              )),
          Positioned(
            top: 95,
            left: 16,
            right: 16,
            child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Provider.of<PopularProvider>(context,listen: false).setPopularItemsShort();
                      },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                        height: 40,
                        width: 40,
                        child: Icon(popularProductShorting.popularItemsShort== false? Icons.list : Icons.grid_view_rounded,size: 25,color: ColorConst.baseColor,),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(child: SearchAndFilterBar(isFilterColor: "white",)),
                  ],
                )),)
        ],
      ),
    );
  }
}
