// --- Reusable Widgets ---
import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Core/HttpApis/http_apis.dart';
import 'package:rapid_super_market/Model/CategoryModel/category_model.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart';
import 'package:rapid_super_market/ViewModels/Controller/PopularController/popular_controller.dart';
import 'package:rapid_super_market/ViewModels/Controller/SearchController/SearchController.dart';
import 'package:rapid_super_market/Views/CustomWidget/LoadNetworkImage/load_network_image.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/HomeScreen/SearchBar/search_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt show SpeechToText;

import '../../../Model/HttpModels/http_auth_model.dart' show Group;
import '../../Screen/BottomNavBar/HomeScreen/BottomSheetScreen/bottom_sheet_screen.dart';

class SearchAndFilterBar extends StatefulWidget {
    SearchAndFilterBar({super.key,  this.is_filter=true,is_search=true,  this.isFilterColor});
  bool is_filter;
  String? isFilterColor;

  @override
  State<SearchAndFilterBar> createState() => _SearchAndFilterBarState();
}

class _SearchAndFilterBarState extends State<SearchAndFilterBar> {
  TextEditingController _searchController=TextEditingController();
  bool is_search = true;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = "Press the button and start speaking...";
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('Status: $val'),
        onError: (val) => print('Error: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            _searchController.text =_text;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ), // More rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.15), // Lighter shadow
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                readOnly: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 24),
                  hintText: 'Search Food',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w500),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 5), // Adjusted padding
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchBarScreen(),));
                  debugPrint('Search bar tapped');
                  // Navigate to search screen
                },
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorConst.baseColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),

                // bottomRight: Radius.circular(12),
                // bottomRight: Radius.circular(12),
              ),
            ),
            child: IconButton(
              icon: Icon(_isListening ? Icons.mic : Icons.mic_none, color: Colors.white, size: 26),
              onPressed: _listen
            ),
          ),
          widget.is_filter==false?SizedBox():
          widget.isFilterColor=="white"?
          Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.filter_alt_outlined, color: Colors.black87, size: 26),
              onPressed: () {
                debugPrint('Filter options opened');
                // Handle filter
              },
            ),
          ):IconButton(
            icon: const Icon(Icons.filter_alt_outlined, color: Colors.black87, size: 26),
            onPressed: () {
              debugPrint('Filter options opened');
              // Handle filter
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, // <-- Important
                backgroundColor: Colors.transparent, // Optional: if you want rounded edges
                builder: (context) {
                  return DraggableScrollableSheet(
                    expand: true, // Makes it full height
                    builder: (context, scrollControllerr) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollControllerr,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: FilterScreen(),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}






class SearchAndFilterBarForScreen extends StatelessWidget {
  const SearchAndFilterBarForScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Container(
              margin: EdgeInsets.only(left: 16,right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5), // More rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.15), // Lighter shadow
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 24),
                  hintText: 'Search Food',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w500),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Image.asset(ImageConst.searchBarList,height: 13,width: 13,color: Colors.black54, ),
                  ) // Adjusted padding
                ),
                onTap: () {
                  debugPrint('Search bar tapped');
                  // Navigate to search screen
                },
              ),
            ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;
  final String deliveryInfo;
  final VoidCallback onOrderNow;

  const PromotionCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.deliveryInfo,
    required this.onOrderNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            // image: DecorationImage(
            //   image: NetworkImage(HttpApi.baseUrl+"/"+imageUrl),
            //   fit: BoxFit.fill,
            //   colorFilter: ColorFilter.mode(
            //     Colors.black.withValues(alpha: 0.4), // Darken image slightly for text readability
            //     BlendMode.darken,
            //   ),
            // ),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withValues(alpha: 0.3),
            //     spreadRadius: 2,
            //     blurRadius: 7,
            //     offset: const Offset(0, 3),
            //   ),
            // ],
          ),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: netWorkImageCustom(
                  fit: BoxFit.fill,
                  imageUrl: HttpApi.baseUrl+"/"+imageUrl,
                  heroTag: "hero1" ,height: double.infinity),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style:   TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(blurRadius: 3.0, color: Colors.black54, offset: Offset(1, 1))
                    ],
                  ),
                ),
                Text(
                  deliveryInfo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    // shadows: [
                    //   Shadow(blurRadius: 0.0, color: Colors.black54, offset: Offset(1, 1))
                    // ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: onOrderNow,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConst.baseColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                elevation: 5,
              ),
              child: const Text(
                'Order Now',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onSeeMore;

  const SectionHeader({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 00, 0.0), // More top padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22, // Slightly larger title
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          TextButton(
            onPressed: onSeeMore,
            style: TextButton.styleFrom(
              foregroundColor: ColorConst.baseColor, // Text color
            ),
            child:   Text(
              subTitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600, // Slightly bolder
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Group category;
  final GestureTapCallback? onTap;
  int index;

    CategoryItem({
    super.key,
    required this.category,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color:Provider.of<SearchProvider>(context).selectedIndex==index? ColorConst.baseColor.withValues(alpha: 0.2) : ColorConst.baseColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(18.0), // More rounded
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
            child : ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(100),
                child: netWorkImageCustom(
                    fit: BoxFit.cover,
                    imageUrl: category.imageUrl,
                    height: 45,width: 45,heroTag: "hero2" ),
              ),
              // child: ClipRRect(
              //     borderRadius: BorderRadiusGeometry.circular(100),
              //     child: Image.network(category.imageUrl,fit: BoxFit.cover,height: 45,width: 45,)
              // ),
            ),
            const SizedBox(height: 10), // More spacing
            Text(
              category.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItemShort extends StatelessWidget {
  final Category category;
  final GestureTapCallback? onTap;
  int index;
    CategoryItemShort({
    super.key,
    required this.category,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
   int selectedIndex = Provider.of<SearchProvider>(context).selectedIndex;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color:selectedIndex==index? ColorConst.baseColor.withValues(alpha: 0.2):Colors.grey.shade200,
          borderRadius: BorderRadius.circular(18.0), // More rounded
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: Image.network(category.imageUrl,fit: BoxFit.fill,height: 45,width: 45,)
              ),
            ),
            const SizedBox(height: 5), // More spacing
            Text(
              category.name,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class FoodCard extends StatelessWidget {
  final FoodItem foodItem;
  final int index;
  bool isBackColor = false;
  final IconData? icon;
  final IconData? icon2;
  FoodCard({
    super.key,
    required this.foodItem,
    required this.index,
    required this.isBackColor,
    required this.icon,
    required this.icon2,
  });

  @override
  Widget build(BuildContext context ) {
    return Container(
      margin: EdgeInsets.only(bottom:10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isBackColor ==false ? ColorConst.foodCardBacColor : Colors.grey.withValues(alpha: 0.1),
      ),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          // Circular Image
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              'https://img.lovepik.com/photo/48043/6014.jpg_wh300.jpg', // Replace with your image path
              width: 80,
              height: 80,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 12),
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Fruit Platers',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "This plater is full of nutrition's\nwith a healthy diet list",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'AED 120',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // Icons
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: Colors.orange),
              //     Icon(Icons.favorite_border, color: Colors.orange),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child:   Icon(icon2, color: Colors.white, size: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class FoodCardHome extends StatelessWidget {

  final popularProductModel foodItem;
  final int index;
   bool isBackColor = false;
  final IconData? icon;
  final IconData? icon2;
  final GestureTapCallback? topWish;
  final GestureTapCallback? bottomCart;
  final Color bottomIconColor;
  FoodCardHome({
    super.key,
    required this.foodItem,
    required this.index,
    required this.isBackColor,
    required this.icon,
    required this.icon2,
    required this.bottomIconColor,
    required this.topWish,
    required this.bottomCart,
  });

  @override
  Widget build(BuildContext context ) {

    return Container(
      margin: EdgeInsets.only(bottom:10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isBackColor ==false ? ColorConst.foodCardBacColor : Colors.grey.withValues(alpha: 0.1),
      ),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          // Circular Image

          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            // child: Image.network(
            //   'https://img.lovepik.com/photo/48043/6014.jpg_wh300.jpg', // Replace with your image path
            //   width: 80,
            //   height: 80,
            //   fit: BoxFit.fill,
            // ),
            child:  netWorkImageCustom(
                width: 80,
                height: 80,
                imageUrl: "${foodItem.imageUrl}", heroTag: "heroTag3"),
          ),
          const SizedBox(width: 12),
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:   [
                Text(
                  "${foodItem.name}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 2),
                foodItem.description=="null"?SizedBox() :  Text("${foodItem.description}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'AED ${foodItem.finalPrice}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // Icons
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: topWish,
                  child: Icon(icon, color: Colors.orange)),
         //     Icon(Icons.favorite_border, color: Colors.orange),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: bottomIconColor ,
                  shape: BoxShape.circle,
                ),
                child:   InkWell(
    onTap: bottomCart,
    child: Icon(icon2, color: Colors.white, size: 16)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class FoodCardFavorite extends StatelessWidget {

  final popularProductModel foodItem;
  final int index;
  bool isBackColor = false;
  final IconData? icon;
  final IconData? icon2;
  final GestureTapCallback? onTapTop;
  final GestureTapCallback? onTapBottom;
  FoodCardFavorite({
    super.key,
    required this.foodItem,
    required this.index,
    required this.isBackColor,
    required this.icon,
    required this.icon2,
    required this.onTapTop,
    required this.onTapBottom,
  });

  @override
  Widget build(BuildContext context ) {
    return Container(
      margin: EdgeInsets.only(bottom:10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isBackColor ==false ? ColorConst.foodCardBacColor : Colors.grey.withValues(alpha: 0.1),
      ),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          // Circular Image

          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            // child: Image.network(
            //   'https://img.lovepik.com/photo/48043/6014.jpg_wh300.jpg', // Replace with your image path
            //   width: 80,
            //   height: 80,
            //   fit: BoxFit.fill,
            // ),
            child:  netWorkImageCustom(
                width: 80,
                height: 80,
                imageUrl: "${foodItem.imageUrl}", heroTag: "heroTag3"),
          ),
          const SizedBox(width: 12),
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:   [
                Text(
                  "${foodItem.name}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 2),
                foodItem.description=="null"?SizedBox() :  Text("${foodItem.description}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'AED ${foodItem.finalPrice}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // Icons
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: onTapTop ,
                  child: Icon(icon, color: Colors.orange)),
              //     Icon(Icons.favorite_border, color: Colors.orange),
               GestureDetector(
               onTap: onTapBottom ,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child:   Icon(icon2, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class PopularItemFoodCard extends StatelessWidget {
  final FoodItem foodItem;
  final int index;
  bool isBackColor = false;
  final IconData? icon;
  final IconData? icon2;
  final GestureTapCallback? redMore;
  final GestureTapCallback? onTapCard;
  PopularItemFoodCard({
    super.key,
    required this.foodItem,
    required this.index,
    required this.isBackColor,
    required this.icon,
    required this.icon2,
    required this.redMore,
    required this.onTapCard,
  });

  @override
  Widget build(BuildContext context ) {
    return Consumer<PopularProvider>(
      builder: (context, value, child) => GestureDetector(
        onTap: onTapCard,
        child: Container(
          margin: EdgeInsets.only(bottom:10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isBackColor ==false ? ColorConst.foodCardBacColor : Colors.grey.withValues(alpha: 0.1),
          ),
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Row(
            children: [
              // Circular Image
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  'https://img.lovepik.com/photo/48043/6014.jpg_wh300.jpg', // Replace with your image path
                  width: 80,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 12),
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Fruit Platers',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Icon(icon, color: Colors.orange),
                      ],
                    ),
                    const SizedBox(height: 4),
                    value.selectedIndex==index?

                    Text(
                      "Broccoli, carrots, bell peppers, soy sauce ... 250 kcal - 350g Read More Broccoli, carrots, bell peppers, soy sauce ... 250 kcal - 350g Read More",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ):

                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 40),
                          width: double.infinity,
                          child: const Text(
                            "Broccoli, carrots, bell peppers, soy sauce ... 250 kcal - 350g Read More Broccoli, carrots, bell peppers, soy sauce ... 250 kcal - 350g Read More",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Positioned(
                          bottom: 0,right: 35,
                          child: InkWell(
                            onTap:redMore,
                            child: Container(
                              height: 15,
                              alignment: Alignment.centerRight,
                              width: 40,
                              color: ColorConst.foodCardBacColor,
                              child: Text("More",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text(
                          'AED 120',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child:   Icon(icon2, color: Colors.white, size: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Icons

            ],
          ),
        ),
      ),
    );
  }
}
