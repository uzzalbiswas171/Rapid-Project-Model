import 'package:flutter/material.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'PaymentMethod/payment_successfull.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Track Your Order',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xffFFF3DB)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   rowWidget(t1: "Order ID: ", t2: "20231008"),
                  SizedBox(height: 3),
                   rowWidget(t1: "Date:", t2: "25th Jun, 2025"),
                  SizedBox(height: 3),
                  rowWidget(t1: "Time:", t2: "Credit Card"),

                ],
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: steps.length,
              itemBuilder: (context, index) {
                final step = steps[index];
                final isLast = index == steps.length - 1;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Timeline
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: step['completed']==true ? Colors.green : Colors.white,
                            border: Border.all(color: Colors.green, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: step['completed']==true
                              ? const Icon(Icons.check, size: 14, color: Colors.white)
                              : null,
                        ),
                        if (!isLast)
                          Container(
                            width: 2,
                            height: 50,
                            color: Colors.green,
                          ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    // Text
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${step['title']}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: step['completed']==true ? Colors.black : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${step['subtitle']}",
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            CustomSubmitButton(text: "View Order", onPressed: () {

            },)

          ],
        ),
      ),
    );
  }
}


final steps = [
  {
    'title': 'Order Confirmed',
    'subtitle': 'Your Order Has been confirmed',
    'completed': true,
  },
  {
    'title': 'Order is being Cooked',
    'subtitle': 'Estimated for 9:12 PM',
    'completed': true,
  },
  {
    'title': 'Courier Delivering',
    'subtitle': 'Estimated for 9:12 PM',
    'completed': false,
  },
  {
    'title': 'Receiving',
    'subtitle': 'Estimated for 9:32 PM',
    'completed': false,
  },
];

