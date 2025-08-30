import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/Profile/profile.dart';
import 'edit_profile.dart';

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({super.key});

  @override
  State<PersonalProfile> createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Personal Profile",
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
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen()));
            },
            child: Text("Edit",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorConst.baseColor,
                letterSpacing: 0.3,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(width: 16,),
        ],
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileListTileWithSwitch(image: "image", title: "title", value: true, onChanged: (value) {

              },),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: ColorConst.baseColor.withValues(alpha: 0.07),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset(ImageConst.person, height: 30, width: 30),
                      title: Text(
                        "FULL NAME",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        "UZZAL BISWAS",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                      ),

                    ),
                    ListTile(
                      leading: Image.asset(ImageConst.messageEmail, height: 30, width: 30),
                      title: Text(
                        "EMAIL",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        "uzzal.biswas.cse@gmail.com",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                      ),

                    ),
                    ListTile(
                      leading: Image.asset(ImageConst.call, height: 30, width: 30),
                      title: Text(
                        "PHONE NUMBER",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        "+880 1518657125",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                      ),

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
