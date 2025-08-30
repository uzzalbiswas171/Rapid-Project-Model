import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/HttpApis/refreshItem.dart';
import 'package:rapid_super_market/ViewModels/Controller/HomeController/home_controller.dart';
import 'package:rapid_super_market/ViewModels/Controller/OfferController/offer_controller.dart';
import 'package:rapid_super_market/ViewModels/Controller/WishListController/wish_list_controller.dart';
import 'package:rapid_super_market/Views/CustomWidget/FoodGrtidCard/food_grid_card.dart';
import 'package:rapid_super_market/Views/CustomWidget/HomeWidget/home_widget.dart';
import 'package:rapid_super_market/Views/CustomWidget/LoadingCard/loading_card.dart';
import 'package:rapid_super_market/Views/Screen/ProductDetailsScreen/product_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../Model/HttpModels/product_model.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}


class _OfferScreenState extends State<OfferScreen> {
  int activeIndex = 0;
  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final offerProvider = Provider.of<OfferProvider>(context, listen: false);
      offerProvider.fetchTodayProducts();
      offerProvider.fetchPopularProducts();
      offerProvider.fetchRecommendProducts();
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final foodData = Provider.of<HomeProvider>(context);
    final wishlist = Provider.of<WishListController>(context);
    final offerProvider = Provider.of<OfferProvider>(context);
    return RefreshIndicator(
      onRefresh: () => Future(() {
        offerProvider.fetchTodayProducts();
      }
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios,color: Colors.black87,size: 20,)),

          title:   Text("Offer & Deals",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600 ,fontSize:18,letterSpacing: -0.1 ),),

          backgroundColor: Colors.grey.withValues(alpha: 0.05),
        ),

        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 16,right: 16,top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CarouselSlider.builder(
                    itemCount: foodData.heroBanners.length,
                    options: CarouselOptions(
                      height: 150.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.95,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },// Slightly larger view
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      enableInfiniteScroll: true,
                      padEnds: true,
                    ),
                    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                      return PromotionCard(
                        imageUrl: foodData.heroBanners[itemIndex].bannerPhotoEn,
                        title: 'Save Upto 50%',
                        subtitle: 'Valid Only On Online Take Away & Dine IN',
                        price: 'AED 75',
                        deliveryInfo: 'Free Delivery',
                        onOrderNow: () {
                          // Handle order for this specific promotion
                          debugPrint('Order now from promotion $itemIndex');
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                SmoothPageIndicator(
                  controller: PageController(initialPage: activeIndex), // Dummy controller
                  count: foodData.heroBanners.length,
                  effect: WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.orange,
                    dotColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 5,),

                SectionHeader(
                  title: 'Today’s Offers',
                  subTitle: "See All",
                  onSeeMore: () {
                     debugPrint('See More Categories');
                  },
                ),
                Container(
                  height: 145,
                  width: MediaQuery.of(context).size.width,
                  child:offerProvider.isLoading
                      ?  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                   child: LoadingCard(height: 145),
                    )
                      : offerProvider.error != null
                      ? Center(child: Text('❌ Error: ${offerProvider.error}'))
                      : offerProvider.todayProducts.isEmpty
                      ? Center(child: Text('📭 No data found'))
                      :  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: offerProvider.todayProducts.length,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                        height: 140,
                        width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "${offerProvider.todayProducts[index].imageUrl}",
                                  fit: BoxFit.fill,
                                  height: 100,
                                  width: 150,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "${offerProvider.todayProducts[index].name}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                  ),
                                  Spacer(),
                                  SaterPoint( rating: 4.9),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "20-30 min",
                                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${offerProvider.todayProducts[index].finalPrice}",
                                    style: TextStyle(fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w800, letterSpacing: -0.3),
                                  ),
                                ],
                              ),
                            ],
                          ),
                                        ),
                        Positioned(
                            right: 10,
                            top: 0,
                            child: Container(
                          height: 25,
                          width: 60,
                          decoration: BoxDecoration(
                            color: ColorConst.baseColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                              alignment: Alignment.center,
                              child: Text("45% OFF",style: TextStyle(color: Colors.black ,fontSize: 14,letterSpacing: -0.3, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                        )),
                      ],
                    ),
                  ),
                ),
                foodData.itemsPopularProduct.isEmpty?SizedBox():   SectionHeader(
                  title: 'Free Delivery',
                  subTitle: "See All",
                  onSeeMore: () {
                    debugPrint('See More Categories');
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,// Disable GridView's own scrolling
                  itemCount: foodData.itemsPopularProduct.length,
                  itemBuilder: (context, index) {
                    final item = foodData.itemsPopularProduct[index];
                    List<popularProductModel> addToWishList=Provider.of<WishListController>(context).addToWishList;
                    bool isGetWish =addToWishList.any((i) => i.id == item.id);
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(productModel: item),));
                        },
                        child: FoodCardHome(
                          bottomIconColor: Colors.orange,
                          bottomCart: () {

                          },
                          topWish: () {
                            Provider.of<WishListController>(context,listen: false).insertDataaddToWishList(item);
                            //  RefreshProviderFunctions.wishListGetRemoveCheckInternetGetData('${item.id}', context);
                          },
                          icon2: Icons.add,icon:isGetWish? Icons.favorite:Icons.favorite_border,foodItem:item,index: index,isBackColor: false,));

                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
