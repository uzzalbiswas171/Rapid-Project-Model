import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/Profile/AddressSet/edit_delivery_address.dart' show EditDeliveryAddress;

enum AddressType { home, office, other }

class AddressModel {
  final AddressType type;
  final String address;
  final String phone;

  AddressModel({
    required this.type,
    required this.address,
    required this.phone,
  });
}

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  final List<AddressModel> addresses = [
    AddressModel(
      type: AddressType.home,
      address: 'Road:09, House:121, Gulshan-1, Mayuri Housing, Dhaka',
      phone: '+8801624513246',
    ),
    AddressModel(
      type: AddressType.office,
      address: 'Road:09, House:121, Gulshan-1, Mayuri Housing, Dhaka',
      phone: '+8801624513246',
    ),
    AddressModel(
      type: AddressType.office,
      address: 'Road:09, House:121, Gulshan-1, Mayuri Housing, Dhaka',
      phone: '+8801624513246',
    ),
  ];

  int selectedIndex = 0;

  IconData getIcon(AddressType type) {
    switch (type) {
      case AddressType.home:
        return Icons.home;
      case AddressType.office:
        return Icons.apartment;
      default:
        return Icons.location_on_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    const cardColor = Color(0xFFFFF9ED);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Delivery Address",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87, size: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: addresses.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final address = addresses[index];
                return AddressCard(
                  model: address,
                  isSelected: selectedIndex == index,
                  icon: getIcon(address.type),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  onEdit: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditDeliveryAddress(),));
                  },
                  onDelete: () {},
                );
              },
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                // Navigate to Add Address screen
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 18),
                    SizedBox(width: 6),
                    Text(
                      "Add New Address",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final AddressModel model;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const AddressCard({
    super.key,
    required this.model,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    const cardColor = Color(0xFFFFF9ED);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio(
              value: true,
              groupValue: isSelected,
              onChanged: (_) => onTap(),
              activeColor: Colors.black,
            ),
            // Checkbox(value: true, onChanged: (_) => onTap(),
            //   activeColor: Colors.black,
            //   checkColor: Colors.white,
            // ),
            Icon(icon, color: Colors.black54),
            const SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  "${model.address}\n${model.phone}",
                  style: const TextStyle(fontSize: 14, height: 1.4),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    child: Image.asset(ImageConst.editIcon, height: 20, width: 20, color: Colors.black54),
                    onTap: onEdit,
                  ),

                ),
                // IconButton(
                //   icon: const Icon(Icons.edit, size: 20),
                //   onPressed: onEdit,
                // ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20),
                  onPressed: onDelete,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
