import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/HomeScreen/LiveBookTable/calender_screen.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/Profile/NotificationScreen/notifications.dart';

class LiveTableScreen extends StatefulWidget {
  const LiveTableScreen({Key? key}) : super(key: key);

  @override
  State<LiveTableScreen> createState() => _LiveTableScreenState();
}

class _LiveTableScreenState extends State<LiveTableScreen> {
  // Table status data
  final Map<String, String> tableStatus = {
    // Ground Floor
    'T1': 'selected',
    'T2': 'booked',
    'T3': 'available',
    'T4': 'selected',
    'T5': 'available',
    'T6': 'booked',
    'T7': 'booked',
    'T8': 'booked',
    'T9': 'available',
    'T10': 'available',

    // 1st Floor
    '1T1': 'selected',
    '1T2': 'booked',
    '1T3': 'available',
    '1T4': 'selected',
    '1T5': 'available',
    '1T6': 'booked',
    '1T7': 'booked',
    '1T8': 'booked',
    '1T9': 'available',
    '1T10': 'available',
  };

  Color getStatusColor(String status) {
    switch (status) {
      case 'selected':
        return Colors.orange;
      case 'booked':
        return Colors.red;
      case 'available':
      default:
        return Colors.grey;
    }
  }

  void onTableTap(String key) {
    setState(() {
      if (tableStatus[key] == 'available') {
        tableStatus[key] = 'selected';
      } else if (tableStatus[key] == 'selected') {
        tableStatus[key] = 'available';
      }
      // booked tables are not clickable
    });
  }

  Widget buildTableGrid(List<String> tableKeys) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: tableKeys.map((key) {
        final status = tableStatus[key]!;
        return GestureDetector(
          onTap: status == 'booked' ? null : () => onTableTap(key),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: getStatusColor(status),
            child: Text(
              key.replaceAll("1", ""), // remove "1" prefix for UI
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.grey.withValues(alpha: 0.1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                LegendDot(color: Colors.orange, label: 'Selected'),
                Spacer(),
                LegendDot(color: Color(0xff8D8D8D), label: 'Available'),
                Spacer(),
                LegendDot(color: Color(0xffDB0D27), label: 'Booked'),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Ground Floor:", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,letterSpacing: -0.3)),
            const SizedBox(height: 10),
            buildTableGrid(['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10']),
            const SizedBox(height: 20),
            const Text("1st Floor:", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,letterSpacing: -0.3)),
            const SizedBox(height: 10),
            buildTableGrid(['1T1', '1T2', '1T3', '1T4', '1T5', '1T6', '1T7', '1T8', '1T9', '1T10']),
            SizedBox(height: 50,),
            CustomSubmitButton(text: "Next", onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => SelectDateScreen(),));
            },)
          ],
        ),
      ),
    );
  }
}

class LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const LegendDot({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 6, backgroundColor: color),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 16,letterSpacing: -0.3)),
      ],
    );
  }
}




class CartCounter extends StatelessWidget {
  const CartCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
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
    );
  }
}

class NotificationCounter extends StatelessWidget {
  const NotificationCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications(),));
      },
      child: Stack(
        children: [
          SizedBox(
            height: 40,
            width: 50,
            child: Icon(Icons.notifications_none_outlined,size: 23,color: Colors.black,),
          ),
          Positioned(
              top: 0,
              right: 5,
              child: CircleAvatar(radius: 9,backgroundColor: ColorConst.baseColor,child: Text("31",style: TextStyle(letterSpacing: -0.3,fontSize: 9,color: Colors.white),),))
        ],
      ),
    );
  }
}