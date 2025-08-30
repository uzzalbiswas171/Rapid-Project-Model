import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedTabIndex = 0;

  final List<String> tabs = ['New Order', 'Cancel', 'Pending', 'Delivered'];

  final List<Map<String, dynamic>> allOrders = [
    {
      'id': '#101',
      'date': '2024-10-15',
      'address': '123 Flavor Lane, Tasty Town,\nYummy State, 45678',
      'status': 'Pending',
      'amount': 310,
    },
    {
      'id': '#102',
      'date': '2024-10-16',
      'address': '456 Sweet Street, Dessert\nCity, Sugar State, 67890',
      'status': 'Processing',
      'amount': 450,
    },
    {
      'id': '#103',
      'date': '2024-10-17',
      'address': '789 Treat Avenue,\nCandyland, Chocolate State, 12345',
      'status': 'Pending',
      'amount': 250,
    },
    {
      'id': '#104',
      'date': '2024-10-18',
      'address': '321 Dessert Boulevard, Pastry\nPlace, Cookie State, 54321',
      'status': 'Processing',
      'amount': 150,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0), // light peach background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          color: ColorConst.baseColor.withValues(alpha: 0.5),
          padding: EdgeInsetsGeometry.only(top: 30),
          child: AppBar(
            elevation: 0,
            backgroundColor: ColorConst.baseColor.withValues(alpha: 0.0),
            centerTitle: true,
            leading: BackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Order",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                letterSpacing: -0.3,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: allOrders.length,
              itemBuilder: (context, index) {
                final order = allOrders[index];
                return _buildOrderCard(order);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(tabs.length, (index) {
          final isSelected = index == selectedTabIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedTabIndex = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.orange : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order ID ${order['id']}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                order['date'],
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                order['address'],
                style: const TextStyle(fontSize: 14, height: 1.4),
              ),

            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order['status'],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: _getStatusColor(order['status']),
                ),
              ),
              SizedBox(height: 30,),
              Text(
                'AED ${order['amount']}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'processing':
        return Colors.blue;
      case 'delivered':
        return Colors.green;
      case 'cancel':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
