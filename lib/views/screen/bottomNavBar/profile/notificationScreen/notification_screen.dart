import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart' show FlutterSwitch;
import 'package:rapid_super_market/Core/Const/color_const.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final Map<String, bool> _notificationSettings = {
    'App Notification': true,
    'Email Notification': false,
    'Offer Notification': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Notification",
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorConst.defaultBackground, // light yellow background
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  )
                ],
              ),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: _notificationSettings.length,
                separatorBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: const Divider(height: 1),
                ),
                itemBuilder: (context, index) {
                  final key = _notificationSettings.keys.elementAt(index);
                  final value = _notificationSettings[key]!;
                  return NotificationToggleTile(
                    title: key,
                    value: value,
                    onChanged: (newValue) {
                      setState(() {
                        _notificationSettings[key] = newValue;
                      });
                    },
                  );
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class NotificationToggleTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationToggleTile({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          FlutterSwitch(
            width: 55.0,
            height: 25.0,
            value: value,
            onToggle: onChanged,
            activeColor: ColorConst.baseColor,
            inactiveColor: Colors.grey.shade200,
          )
        ],
      ),
    );
  }
}
