import 'package:flutter/material.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart';
import 'package:rapid_super_market/ViewModels/Controller/AllGroupCategoryItemController/all_group_category_item_controller.dart';
 import 'package:rapid_super_market/ViewModels/Controller/SearchController/SearchController.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/CustomWidget/HomeWidget/home_widget.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/HomeScreen/PopularScreen/popular_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../Model/HttpModels/http_auth_model.dart';

class CategoryScreen extends StatefulWidget {
   CategoryScreen({super.key, required this.group});
   List<Group> group;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List <popularProductModel> groupWiseProduct=[];
  @override
  Widget build(BuildContext context) {
   final indexSelect = Provider.of<SearchProvider>(context);
   final allItems = Provider.of<GroupCategoryItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:   Text(
          "Category",
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
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             GridView.builder(
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               itemCount: widget.group.length,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 3,
                 mainAxisSpacing: 20,
                 crossAxisSpacing: 10,
                 mainAxisExtent: 130
               ),
                 itemBuilder: (context, index) {
                   final category = widget.group[index];
                   return CategoryItem(category: category,onTap: () {
                     Provider.of<SearchProvider>(context,listen: false).setIndexProvider(index);
                   },index: index,);


                 },),
              SizedBox(height: 40,),
              CustomSubmitButton(text: "Apply", onPressed: () {
                 groupWiseProduct.clear();
                 int count=-1;
              for(var i in allItems.items){
                count++;
                if(allItems.items[count].purchaseGroupId=='${widget.group[indexSelect.selectedIndex].id}'){
                  groupWiseProduct.add(allItems.items[count]);
                }
              }
                Navigator.push(context, MaterialPageRoute(builder: (context) => PopularScreen(
                    ItemList: groupWiseProduct,
                    TitleName: "${widget.group[indexSelect.selectedIndex].name}"),));
              },)
            ],
          ),
        ),
      ),
    );
  }
}
