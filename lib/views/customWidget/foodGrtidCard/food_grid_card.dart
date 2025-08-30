import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/HttpApis/refreshItem.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart';
import 'package:rapid_super_market/ViewModels/Controller/AddToCartController/add_to_cart_controller.dart';
import 'package:rapid_super_market/ViewModels/Controller/WishListController/wish_list_controller.dart';
import 'package:rapid_super_market/Views/CustomWidget/LoadNetworkImage/load_network_image.dart';
import 'package:provider/provider.dart';

// This is the main widget for your custom food card.
class FoodGridCard extends StatelessWidget {
  // Define properties for the card to make it reusable.
  final popularProductModel foodItem;
  final String imageUrl;
  final String title;
  final String subtitle;
  final double price;
  final double rating;
  final String id;

  // Constructor to initialize the card with data.
  const FoodGridCard({
    Key? key,
    required this.foodItem,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<popularProductModel> addToWishList=Provider.of<WishListController>(context).addToWishList;

    bool isGetWish = addToWishList.any((i) => i.id == foodItem.id);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Spacer(),
             Container(
               margin: EdgeInsets.only(bottom: 1,left: 0.7,right: 0.7),
               height: 110,
               width: double.infinity,
               decoration: BoxDecoration(
                  // color: ColorConst.baseColor.withValues(alpha: 0.3),
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(20),

              )
             )
            ],
          ),
        ),
        Positioned(child: Padding(
          padding: const EdgeInsets.only(left: 13.0,right: 13,bottom: 5),
          child: Column(
            children: [
              // Stack to overlay the heart icon on the image.
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(15),
                    child: netWorkImageCustom(imageUrl: imageUrl,
                        height: 78,width: 115,heroTag: "imgHero4" ),
                  ),
                  // Positioned heart icon for "add to favorites".
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: InkWell(
                      onTap: () {
                        Provider.of<WishListController>(context,listen: false).insertDataaddToWishList(foodItem);
                        //   Provider.of<WishListController>(context,listen: false).addWishListProvider("${PrefsHelper.getUserCustomerId()}", "${id}", context);
                      //  RefreshProviderFunctions.wishListGetRemoveCheckInternetGetData('${id}', context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child:   Icon(
                          isGetWish ? Icons.favorite:Icons.favorite_border,
                          color: Colors.red,
                          size: 18,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              // Padding for the text content below the image.
              Consumer<WishListController>(
                  builder:(context, value, child) {
                    List<popularProductModel> addToCartList=Provider.of<AddToCartProvider>(context).addToCartList;

                    bool isGet = addToCartList.any((item) => item.id == foodItem.id);
                    return Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row for title and rating.
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Food item title.
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style:  TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                    overflow: TextOverflow.ellipsis, // Handle long titles.
                                  ),
                                  Text(
                                    subtitle,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey[600],
                                    ),
                                    overflow: TextOverflow.ellipsis, // Handle long subtitles.
                                    maxLines: 2, // Allow subtitle to wrap to two lines.
                                  ),
                                  SizedBox(height: 2,),
                                  Text(
                                    'AED ${price.toStringAsFixed(2)}', // Format price to two decimal places.
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Rating display.
                            Column(
                              children: [
                                SizedBox(height: 10,),
                                SaterPoint( rating: 4.9),
                                SizedBox(height: 10,),
                                ElevatedButton(
                                  onPressed: () {
                                    Provider.of<AddToCartProvider>(context,listen: false).insertDataAddToCartList(foodItem);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:isGet? ColorConst.baseColor:Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6), // Optional: adjust for 30x30
                                    ),
                                    padding: EdgeInsets.zero, // Remove padding
                                    minimumSize: const Size(30, 27), // Set to 30x30
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink tap target
                                  ),
                                  child: const Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                    size: 16, // Adjust icon size to fit nicely in 30x30
                                  ),
                                )
                              ],
                            ),

                          ],
                        ),

                      ],
                    ),
                  );
                }
              ),
            ],
          ),
        ))
      ],
    );
  }
}

class SaterPoint extends StatelessWidget {
    SaterPoint({super.key,required this.rating});
    double rating;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber[700], // Star color.
          size: 12,
        ),
        const SizedBox(width: 0), // Small space between star and number.
        Text(
          rating.toStringAsFixed(1), // Display rating with one decimal place.
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700],
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
