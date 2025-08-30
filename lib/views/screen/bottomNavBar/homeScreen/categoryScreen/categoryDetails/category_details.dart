// import 'package:flutter/material.dart';
// import 'package:rapid_super_market/Const/color_const.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../../Controller/HomeController/home_controller.dart';
// import '../../../../../CustomWidget/HomeWidget/home_widget.dart';
//
// class CategoryDetailsScreen extends StatefulWidget {
//   const CategoryDetailsScreen({super.key});
//    // String CategoryName;
//    // String CategoryId;
//   @override
//   State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
// }
//
// class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final foodData = Provider.of<FoodData>(context);
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: ColorConst.baseColor.withValues(alpha: 0.5),
//       //   centerTitle: true,
//       //   title:   Text(
//       //     "Pizza ",
//       //     style: const TextStyle(
//       //       fontSize: 18, // Slightly larger title
//       //       fontWeight: FontWeight.bold,
//       //       color: Colors.black87,
//       //     ),
//       //   ),
//       //   actions: [
//       //     Stack(
//       //       children: [
//       //         SizedBox(
//       //           height: 40,
//       //           width: 50,
//       //           child: Icon(Icons.shopping_cart_outlined,size: 22,color: Colors.black,),
//       //         ),
//       //         Positioned(
//       //             top: 0,
//       //             left: 5,
//       //             child: CircleAvatar(radius: 9,backgroundColor: ColorConst.baseColor,child: Text("31",style: TextStyle(letterSpacing: -0.3,fontSize: 9,color: Colors.white),),))
//       //       ],
//       //     ),
//       //     SizedBox(width: 10,),
//       //   ],
//       //   leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios,color: Colors.black87,size: 20,)),
//       // ),
//       body: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               children: [
//                 Container(
//                   height: 250,
//                   width: double.infinity,
//                   color: ColorConst.baseColor.withValues(alpha: 0.5),
//                 ),
//                 Spacer(),
//               ],
//             ),
//           ),
//           Positioned(
//               top: 40,
//               child:Container(
//           height: 50,
//           width: MediaQuery.of(context).size.width,
//                 child: ListTile(
//                   contentPadding: EdgeInsets.only(left: 20,right: 10),
//                   leading: IconButton(onPressed: () {
//                     Navigator.pop(context);
//                   }, icon: Icon(Icons.arrow_back_ios,color: Colors.black87,size: 20,)),
//                   title:   Row(
//                     children: [
//
//                       Text(
//                         "Pizza ",
//                         style: const TextStyle(
//                           fontSize: 18, // Slightly larger title
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       Spacer(),
//                       Stack(
//                         children: [
//                           SizedBox(
//                             height: 40,
//                             width: 50,
//                             child: Icon(Icons.shopping_cart_outlined,size: 22,color: Colors.black,),
//                           ),
//                           Positioned(
//                               top: 0,
//                               left: 5,
//                               child: CircleAvatar(radius: 9,backgroundColor: ColorConst.baseColor,child: Text("31",style: TextStyle(letterSpacing: -0.3,fontSize: 9,color: Colors.white),),))
//                         ],
//                       ),
//                       SizedBox(width: 10,),
//                     ],
//                   ),
//
//                 ),
//
//     ),
//
//             ),
//           Positioned(
//             bottom: 0,
//               left: 30,
//               right: 30,
//               child: Container(
//                 height: MediaQuery.of(context).size.height-150,
//                 width: double.infinity,
//                 color: Colors.red.withValues(alpha: 0.0),
//                 child: ListView.builder(// Disable GridView's own scrolling
//                   itemCount: foodData.popularFoodItems.length,
//                   itemBuilder: (context, index) {
//                     final item = foodData.popularFoodItems[index];
//                     return FoodCard(icon2: Icons.shopping_cart_outlined,icon: Icons.favorite_border,foodItem: item,index: index,isBackColor: false,);
//                   },
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
