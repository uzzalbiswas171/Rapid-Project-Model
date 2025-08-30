import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const backgroundColor = Color(0xFFFFF9ED);

    InputDecoration smartDecoration(String hintText) {
      return InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: backgroundColor,
        hintStyle: const TextStyle(color: Colors.black87),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      );
    }

    Widget buildLabel(String label) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            letterSpacing: 0.8,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          ImageConst.netProfile, // Replace with your asset or network image
                          ),
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.edit, size: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Full Name
              buildLabel("FULL NAME"),
              TextFormField(
                initialValue: "Vishal Khadok",
                decoration: smartDecoration("Enter full name"),
              ),
              const SizedBox(height: 20),
              // Email
              buildLabel("EMAIL"),
              TextFormField(
                initialValue: "hello@halallab.co",
                decoration: smartDecoration("Enter email address"),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Phone Number
              buildLabel("PHONE NUMBER"),
              TextFormField(
                initialValue: "408-841-0926",
                decoration: smartDecoration("Enter phone number"),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              // Bio
              buildLabel("BIO"),
              TextFormField(
                initialValue: "I love fast food",
                maxLines: 3,
                decoration: smartDecoration("Tell us about yourself"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
