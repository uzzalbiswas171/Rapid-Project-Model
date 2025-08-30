// --- Home Page ---
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Core/HttpApis/refreshItem.dart';
import 'package:rapid_super_market/Core/LocalDataBase/SharePref/share_prefrence.dart';
import 'package:rapid_super_market/Core/ThemeManage/theme_manage.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/HomeScreen/CategoryScreen/category_screen.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/HomeScreen/LiveBookTable/live_book_table.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/HomeScreen/PopularScreen/popular_screen.dart';
import 'package:rapid_super_market/Views/Screen/ProductDetailsScreen/product_details_screen.dart';
import 'package:provider/provider.dart';


import '../../../../ViewModels/Controller/AddToCartController/add_to_cart_controller.dart';
import '../../../../ViewModels/Controller/HomeController/home_controller.dart';
import '../../../../ViewModels/Controller/WishListController/wish_list_controller.dart';
import '../../../CustomWidget/FoodGrtidCard/food_grid_card.dart';
import '../../../CustomWidget/HomeWidget/home_widget.dart';
import '../../../CustomWidget/LoadingCard/loading_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<AddToCartProvider>(context,listen: false).loadAddToCartList();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final foodData = Provider.of<FoodData>(context);
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return  RefreshIndicator(
      onRefresh: () => Future(() {
        RefreshProviderFunctions.homeCheckInternetGetData(context);
        }
      ),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            alignment: Alignment.center,
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 195.0, // Increased height for more header content
                    floating: true,
                    pinned: true,
                    leading:IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black, size: 24),
                      onPressed: () {
                        Scaffold.of(context).openDrawer(); // Example: Open a drawer
                      },
                    ) ,
                    title:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(""),
                        Stack(
                          children: [
                            Container(
                              width: 50,
                              height: 41,
                              padding: EdgeInsets.only(left: 8),
                              child: const CircleAvatar(
                                radius: 25, // Slightly larger avatar
                                backgroundImage: NetworkImage('https://media.licdn.com/dms/image/v2/D5603AQFO9F3F2KuqAA/profile-displayphoto-scale_200_200/B56ZelVxToHEAY-/0/1750825638181?e=1757548800&v=beta&t=yUoSxBzXIrxgFSXTSW0yAUD9goTWV4hJUnC99CvpwRM'), // Random user image
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                padding: const EdgeInsets.all(3), // Slightly larger padding
                                decoration: BoxDecoration(
                                  color: ColorConst.baseColor,
                                  shape: BoxShape.circle // More rounded
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 18, // Min width/height for notification badge
                                  minHeight: 18,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '3',
                                  style: context.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    backgroundColor: ColorConst.sliverAppbarColor, // Background color when collapsed
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Container(
                        color: ColorConst.sliverAppbarColor, // Background color of the expanded app bar
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                '${PrefsHelper.getUserName()}',
                                  style: context.textTheme.bodyLarge?.copyWith(
                                   fontSize: 28, // Larger font
                                    fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 3), // More spacing
                              Row(
                                children:   [
                                  Text(
                                    'What do you want to Eat?',
                                    style: context.textTheme.bodyMedium?.copyWith(
                                      // fontSize: 28, // Larger font
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Image.asset(ImageConst.hotCoffe,color: ColorConst.baseColor,height: 16,width: 16,), // Different food icon
                                ],
                              ),
                              const SizedBox(height: 25), // More spacing
                              // Search Bar
                              SearchAndFilterBar(is_search: false,), // Reusable widget
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Consumer<HomeProvider>(
                            builder: (context, value, child) {
                              if (value.isLoadingBanner || value.heroBanners.isEmpty) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: LoadingCard(height: 155),
                                );
                              }
      
                              if (value.errorBanner != null) {
                                return Center(child: Text(value.errorBanner!));
                              }
                             return CarouselSlider.builder(
                                itemCount: homeProvider.heroBanners.length,
                                options: CarouselOptions(
                                  height: 155.0,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.95, // Slightly larger view
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                  enableInfiniteScroll: true,
                                  padEnds: true,
                                ),
                                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                                  return PromotionCard(
                                    imageUrl: homeProvider.heroBanners[itemIndex].bannerPhotoEn,
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
                              );
                            },
      
                          ),
                        ),
                        SizedBox(height: 5,),
                        // Categories Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SectionHeader(
                            title: 'Categories',
                            subTitle: "See More",
                            onSeeMore: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(
                                group: homeProvider.groupList,
                              ),));
                              debugPrint('See More Categories');
                            },
                          ),
                        ),
                        Consumer<HomeProvider>(
                          builder: (context, provider,child) {
                            if (provider.isLoading || provider.groupList.isEmpty) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: LoadingCard(height: 120),
                              );
                            }

                            if (provider.error != null) {
                              return Center(child: Text(provider.error!));
                            }


                            return SizedBox(
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                itemCount: provider.groupList.length,
                                itemBuilder: (context, index) {
                                  final category = provider.groupList[index];
                                  return
                                    CategoryItem(category: category,onTap: () {
                                    },index: index,);
                                },
                              ),
                            );
                          },
      
                        ),
                        SizedBox(height: 5,),
                        //Popular Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SectionHeader(
                          // Popular Section
                            title: 'Popular',
                            subTitle: "See More",
                            onSeeMore: () {
                              debugPrint('See More Popular Items');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PopularScreen(
                                ItemList: homeProvider.itemsPopularProduct,
                                TitleName: "Popular Items",
                              ),));
                            },
                          ),
                        ),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: Consumer<HomeProvider>(
                            builder: (context, provider, child) {
                              if (provider.isLoadingPopularProduct) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: LoadingCard(height: 120),
                                );
                              }if(provider.itemsPopularProduct==null){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: LoadingCard(height: 120),
                                );
                              }

                            return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: ListView.builder(
                                  shrinkWrap: true, // Important for GridView inside CustomScrollView/SliverList
                                  physics: const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                                  itemCount: provider.itemsPopularProduct.length>5 ?5 :provider.itemsPopularProduct.length,
                                  itemBuilder: (context, index) {
                                    final item=provider.itemsPopularProduct[index];
                                    return popularListCardWidget(item: item, index: index);
                                  },
                                ),
                              );
        },
                          ),
                        ),
                        // Recommended
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SectionHeader(
                            title: 'Recommended',
                            subTitle: "",
                            onSeeMore: () {
                              debugPrint('See More Popular Items');
                            },
                          ),
                        ),
              MediaQuery.removePadding(
                removeTop: true,
                       removeBottom: true,
                       context: context,
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 16),
                         child: Consumer<HomeProvider>(
                             builder: (context, provider, child) {
      
                               if (provider.isLoadingRecommandProduct) {
                                 return Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                   child: LoadingCard(height: 120),
                                 );
                               }if(provider.isLoadingRecommandProduct==null){
                                 return Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                   child: LoadingCard(height: 120),
                                 );
                               }
                             return GridView.builder(
                               physics: NeverScrollableScrollPhysics(),
                               shrinkWrap: true,
                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                 crossAxisCount: 2,
                                 crossAxisSpacing: 10,
                                 mainAxisSpacing: 10,
                                 mainAxisExtent: 160
                             ), itemCount:provider.itemsRecommandProduct.length,itemBuilder: (context, index) {
                               return GestureDetector(
                                 onTap: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(productModel: provider.itemsRecommandProduct[index]),));
                                 },
                                 child: FoodGridCard(
                                   foodItem: provider.itemsRecommandProduct[index],
                                   id: "${provider.itemsRecommandProduct[index].id}",
                                 imageUrl: '${provider.itemsRecommandProduct[index].imageUrl}', // Placeholder image
                                 title: '${provider.itemsRecommandProduct[index].name}',
                                 subtitle: provider.itemsRecommandProduct[index].description=="null"?"Description : ":'${provider.itemsRecommandProduct[index].description??""}',
                                 price: double.parse("${provider.itemsRecommandProduct[index].finalPrice}"),
                                 rating:double.parse("${provider.itemsRecommandProduct[index].code}"),
                                 ),
                               );
                             },);
                           }
                         ),
                       ),
                     ),
              
                        // Recommended
                    homeProvider.recentViewItemList.length==0?SizedBox():    Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SectionHeader(
                            title: 'Recently Viewed',
                            subTitle: "",
                            onSeeMore: () {
                              debugPrint('See More Popular Items');
                            },
                          ),
                        ),
                        Consumer<HomeProvider>(
                          builder: (context, homeProvider, child) =>homeProvider.recentViewItemList.length==0?SizedBox():
                          MediaQuery.removePadding(
                            removeTop: true,
                            removeBottom: true,
                            context: context,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    mainAxisExtent: 160
                                ), itemCount: homeProvider.recentViewItemList.length,itemBuilder: (context, index) {
                                return FoodGridCard(
                                  foodItem: homeProvider.itemsRecommandProduct[index],
                                  id: "110",
                                  imageUrl: foodData.carouselImages[index],
                                  //  imageUrl: 'https://www.spicebangla.com/wp-content/uploads/2024/07/Vegetable-Sandwich-Recipe01.webp', // Placeholder image
                                  title: 'Sandwice',
                                  subtitle: 'With Cheesy Chicken and Special Sauce',
                                  price: 7.00,
                                  rating: 4.5,
                                );
                              },),
                            ),
                          ),
                        ),
                        SizedBox(height: 50,),
                      // Add some bottom padding
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.3-10,
                  right: 15,
                  child: SizedBox(
                    width: 140,
                    child: CustomSubmitButton(text: "Book A Table", onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LiveTableScreen(),));
                                },),
                  ))
            ],
          ),
          drawer: const Drawer( // Example drawer
            child: Center(child: Text('Drawer Content')),
          ),
        ),
    )
    ;
  }
}





Widget popularListCardWidget({
  required popularProductModel item,
  required int index,
}){
  return Consumer<WishListController>(
      builder:(context, value, child) {
        List<popularProductModel> addToWishList=Provider.of<WishListController>(context).addToWishList;
        List<popularProductModel> addToCartList=Provider.of<AddToCartProvider>(context).addToCartList;
        bool isGet = addToCartList.any((i) => i.id == item.id);
        bool isGetWish = addToWishList.any((i) => i.id == item.id);

        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(productModel: item),));
            },
            child: FoodCardHome(
              bottomIconColor:isGet? Colors.orange : Colors.grey  ,
              bottomCart: () {
                Provider.of<AddToCartProvider>(context,listen: false).insertDataAddToCartList(item);
                // addToCartAdd(provider.itemsPopularProduct[index]);
              },
              topWish: () {
                Provider.of<WishListController>(context,listen: false).insertDataaddToWishList(item);
                //  RefreshProviderFunctions.wishListGetRemoveCheckInternetGetData('${item.id}', context);
              },
              icon2: Icons.shopping_cart_outlined,icon:isGetWish? Icons.favorite:Icons.favorite_border,
              foodItem: item,index: index,isBackColor: false,));
      }
  );
}