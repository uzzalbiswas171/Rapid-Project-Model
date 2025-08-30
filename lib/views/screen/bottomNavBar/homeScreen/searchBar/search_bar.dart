import 'package:flutter/material.dart';
import 'package:rapid_super_market/ViewModels/Controller/HomeController/home_controller.dart';
import 'package:rapid_super_market/ViewModels/Controller/SearchController/SearchController.dart';
import 'package:provider/provider.dart';
import '../../../../CustomWidget/HomeWidget/home_widget.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {

  @override
  Widget build(BuildContext context) {
    final foodData = Provider.of<FoodData>(context);
    return Scaffold(
      backgroundColor: Color(0xfff1f1f5),
      appBar: AppBar(
        backgroundColor: Color(0xfff1f1f5),
        centerTitle: true,
        title:   Text(
          "Search Food",
          style: const TextStyle(
            fontSize: 18, // Slightly larger title
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black87,size: 20,)),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchAndFilterBarForScreen(),
              SizedBox(height: 20,),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: foodData.categories.length,
                  itemBuilder: (context, index) {
                    final category = foodData.categories[index];
                    return CategoryItemShort(category: category,index: index,onTap: () {
                      Provider.of<SearchProvider>(context,listen: false).setIndexProvider(index);
                    },);
                  },
                ),
              ),
              Padding(
                padding:   EdgeInsets.only(left: 16.0,top: 16,bottom: 16),
                child: Row(
                  children: [
                    Text("My recent orders",style: TextStyle(
                        color: Colors.black.withValues(alpha: 0.9),
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),),
                    Spacer(),
                    Text("Delete",style: TextStyle(
                        color: Colors.red.withValues(alpha: 0.9),
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),),
                    SizedBox(width: 20,)
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(right: 0.0),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 40,
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 16,right: 16),
                        leading: Icon(Icons.search,color: Colors.black45,size: 22),
                        title: Row(
                          children: [
                            Text("Search data $index",style:TextStyle(fontWeight: FontWeight.w500,letterSpacing: -0.3,color: Colors.black.withValues(alpha: 0.8)),),
                            Spacer(),
                            IconButton(onPressed: () {

                            }, icon: Icon(Icons.highlight_remove_outlined,color :Colors.black45, size: 22)),
                          ],
                        ),

                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:   EdgeInsets.only(left: 16.0,top: 16,bottom: 16),
                child: Text("My recent orders",style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.9),
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  shrinkWrap: true, // Important for GridView inside CustomScrollView/SliverList
                  physics: const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final item = foodData.popularFoodItems[index];
                    return Container(
                      margin: EdgeInsets.only(bottom:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withValues(alpha: 0.1),
                      ),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                     // height: 100,
                      child: Row(
                        children: [
                          // Circular Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              'https://img.lovepik.com/photo/48043/6014.jpg_wh300.jpg', // Replace with your image path
                              width: 60,
                              height: 60,
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
                                const Text(
                                  'Fruit Platers',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    letterSpacing: -0.2
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Jamuna Restaurant",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber[700], // Star color.
                                      size: 12,
                                    ),
                                    const SizedBox(width: 4), // Small space between star and number.
                                    Text(
                                     "0.5", // Display rating with one decimal place.
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.add_location_outlined,
                                          color: Colors.amber[700], // Star color.
                                          size: 12,
                                        ),
                                        const SizedBox(width: 4), // Small space between star and number.
                                        Text(
                                          "199m", // Display rating with one decimal place.
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
          
                              ],
                            ),
                          ),
          
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
