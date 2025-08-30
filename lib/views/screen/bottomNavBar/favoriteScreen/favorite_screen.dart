import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/HttpApis/refreshItem.dart';
import 'package:rapid_super_market/ViewModels/Controller/WishListController/wish_list_controller.dart';
import 'package:rapid_super_market/Views/CustomWidget/HomeWidget/home_widget.dart';
import 'package:rapid_super_market/Views/CustomWidget/LoadingCard/loading_card.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/HomeScreen/LiveBookTable/live_book_table.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    Provider.of<WishListController>(context,listen: false).loadaddToWishList();
    RefreshProviderFunctions.wishListCheckInternetGetData(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final cartList=Provider.of<WishListController>(context).addToWishList;
    final cartProvider=Provider.of<WishListController>(context);
    double h= MediaQuery.of(context).size.height;
    double w= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black87,size: 20,)),

        title:   Text("Live Table",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600 ,fontSize:18,letterSpacing: -0.3 ),),
        actions: [
          CartCounter(),
          SizedBox(width: 10,),
        ],
        backgroundColor: Colors.grey.withValues(alpha: 0.05),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 16,right: 16,top: 10),
        child: Column(
          children: [
            SearchAndFilterBar(is_filter: false,),
            SizedBox(height: 15,),
            Expanded(
              child: Consumer<WishListController>(
              builder: (context, value, child) {
                return
                    value.isEmpty=="Empty" && value.addToWishList.length==0?
                    Center(child: Text("Data not found"),):
                    value.addToWishList.length==0?
                    LoadingCard(height: double.infinity):
              ListView.builder(
                  itemCount: value.addToWishList.length, // Use _wishListItemMain
                  itemBuilder: (context, index) {
                    final item = value.addToWishList[index]; // Use item from wishlist controller
                    // You might need to map `Item` from your model to `FoodItem` if they are different
                    // For now, assuming `Item` has the necessary properties for `FoodCard`
                    // Or you might need to adjust FoodCard to accept `Item` directly.
                    return FoodCardFavorite(
                      foodItem:item,
                      //FoodItem(id: item.id!, name: item.itemName!, imageUrl: item.itemImage!, price: item.itemPrice!.toDouble()), // Example mapping
                      index: index,
                      isBackColor: false,
                      icon: Icons.favorite,
                      onTapTop: () {

                      },
                      icon2: Icons.delete,
                      onTapBottom: () {
                        Provider.of<WishListController>(context,listen: false).insertDataaddToWishList(item);

                     //   RefreshProviderFunctions.wishListGetRemoveCheckInternetGetData('${item.id}', context);
                      },

                    );
                  },
                );
              },
            ),)
          ],
        ),
      )
    );
  }
}
