import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PercelTrackingOnMapScreen extends StatefulWidget {
  const PercelTrackingOnMapScreen({super.key});

  @override
  State<PercelTrackingOnMapScreen> createState() => _PercelTrackingOnMapScreenState();
}

class _PercelTrackingOnMapScreenState extends State<PercelTrackingOnMapScreen> {
  Set<Marker> _markers = {
    Marker(
      markerId: const MarkerId('parcel_location'),
      position: const LatLng(37.7749, -122.4194),
      infoWindow: const InfoWindow(title: 'Parcel Location'),
    )
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Track Your Parcel',
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              // child: GoogleMap(
              //   initialCameraPosition: const CameraPosition(
              //     target: LatLng(37.7749, -122.4194), // Example coordinates
              //     zoom: 12,
              //   ),
              //   markers: {
              //     const Marker(
              //       markerId: MarkerId('parcel_location'),
              //       position: LatLng(37.7749, -122.4194),
              //       infoWindow: InfoWindow(title: 'Parcel Location'),
              //     )
              //   },
              // ),
              child:Center(
                child:Text("Google map is loading")
              ),
            ),
            BottomTrackingPart()
          ],
        ),
      ),
    );
  }
}











class BottomTrackingPart extends StatelessWidget {
  const BottomTrackingPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 600,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rider Info
          Row(
            children: [
              // Profile Image
              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/100', // placeholder image
                ),
              ),
              const SizedBox(width: 12),
              // Name, ID, Stars
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Cristopert Dastin',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'ID 213752',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        Icon(Icons.star, size: 16, color: Colors.amber),
                      ],
                    ),
                  ],
                ),
              ),
              // Chat & Call buttons
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline, color: Colors.orange),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.call, color: Colors.orange),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Delivery Time Info
          const Text(
            'Your Delivery Time',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Estimated 8:30 - 9:15 PM',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),

          // Progress Bar (Icon Steps)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.calendar_today, color: Colors.orange),
              Expanded(
                child: Divider(color: Colors.orange, thickness: 1, endIndent: 8, indent: 8),
              ),
              Icon(Icons.restaurant_menu, color: Colors.orange),
              Expanded(
                child: Divider(color: Colors.orange, thickness: 1, endIndent: 8, indent: 8),
              ),
              Icon(Icons.delivery_dining, color: Colors.orange),
              Expanded(
                child: Divider(color: Colors.grey, thickness: 1, endIndent: 8, indent: 8),
              ),
              Icon(Icons.check_circle, color: Colors.grey),
            ],
          ),

          const SizedBox(height: 16),

          // Order Info
          const Text(
            'Order',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('2 Burger With Meat'),
              Text('AED 283'),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('4 Ordinary Burgers'),
              Text('\$283'),
            ],
          ),
        ],
      ),
    );
  }
}
