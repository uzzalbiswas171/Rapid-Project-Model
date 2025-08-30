import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:intl/intl.dart';

import 'live_book_table.dart'; // A




class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  DateTime _focusedDay = DateTime.now(); // Represents the month currently displayed
  DateTime _selectedDate = DateTime.now(); // The actual selected day
  String? _selectedTime;
  int _guestCount = 1;
  final TextEditingController _guestController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize selectedDate to current date for a dynamic calendar
    _selectedDate = DateTime(
      _focusedDay.year,
      _focusedDay.month,
      _focusedDay.day,
    );
    _guestController.text = _guestCount.toString();
  }

  @override
  void dispose() {
    _guestController.dispose();
    super.dispose();
  }

  // Helper to get the number of days in a given month
  int _daysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  // Helper to get the weekday of the first day of the month
  // DateTime.weekday returns 1 for Monday, 7 for Sunday.
  // We want 0 for Sunday for our grid, so we adjust.
  int _firstDayWeekday(int year, int month) {
    // DateTime.weekday: Monday = 1, ..., Sunday = 7
    // Adjust to 0 for Sunday, 1 for Monday, etc.
    final firstDayOfMonth = DateTime(year, month, 1);
    return (firstDayOfMonth.weekday % 7); // 0 for Sunday, 1 for Monday...
  }

  // Helper to build a calendar day widget
  Widget _buildCalendarDay(DateTime date, bool isSelected, bool isCurrentMonth) {
    return GestureDetector(
      onTap: () {
        if (isCurrentMonth) {
          setState(() {
            _selectedDate = date;
          });
        }
      },
      child: CircleAvatar(
        radius: 20,
        backgroundColor: isSelected ? Colors.orange : Colors.transparent,
        child: Text(
          date.day.toString(),
          style: TextStyle(
            color: isSelected ? Colors.white : (isCurrentMonth ? Colors.black : Colors.grey),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14
          ),
        ),
      ),
    );
  }

  // Helper to build a time slot button
  Widget _buildTimeSlot(String time) {
    bool isSelected = _selectedTime == time;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTime = time;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey.shade300,
          ),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calculate calendar grid properties for the _focusedDay
    final int daysInCurrentMonth = _daysInMonth(_focusedDay.year, _focusedDay.month);
    final int firstDayOffset = _firstDayWeekday(_focusedDay.year, _focusedDay.month); // 0 = Sun, 1 = Mon, ..., 6 = Sat

    // Calculate days from previous month to fill the beginning of the grid
    final int daysFromPrevMonth = firstDayOffset;
    final DateTime prevMonth = DateTime(_focusedDay.year, _focusedDay.month - 1);
    final int daysInPrevMonth = _daysInMonth(prevMonth.year, prevMonth.month);

    // List to hold all the days (previous, current, next month fillers) for the grid
    List<DateTime> days = [];

    // Add days from previous month
    for (int i = 0; i < daysFromPrevMonth; i++) {
      days.add(DateTime(prevMonth.year, prevMonth.month, daysInPrevMonth - daysFromPrevMonth + 1 + i));
    }

    // Add days from current month
    for (int i = 1; i <= daysInCurrentMonth; i++) {
      days.add(DateTime(_focusedDay.year, _focusedDay.month, i));
    }

    // Add days from next month to fill the end of the grid (to make it a full 6x7 grid potentially)
    int daysToFillNextMonth = (42 - days.length); // Max 6 weeks * 7 days = 42
    if (daysToFillNextMonth < 0) daysToFillNextMonth = 0; // Should not happen with typical calendars

    final DateTime nextMonth = DateTime(_focusedDay.year, _focusedDay.month + 1);
    for (int i = 1; i <= daysToFillNextMonth; i++) {
      days.add(DateTime(nextMonth.year, nextMonth.month, i));
    }


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
        backgroundColor: Colors.grey.withValues(alpha: 0.05),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendar Card
            Container(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 0,bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.black54,size: 16,),
                        onPressed: () {
                          setState(() {
                            _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
                          });
                        },
                      ),
                      Text(
                        DateFormat.yMMMM().format(_focusedDay), // e.g., "September 2025"
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 16,),
                        onPressed: () {
                          setState(() {
                            _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Weekday headers
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('SUN', style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w700)),
                      Text('MON', style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w700)),
                      Text('TUE', style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w700)),
                      Text('WED', style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w700)),
                      Text('THU', style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w700)),
                      Text('FRI', style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w700)),
                      Text('SAT', style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w700)),
                    ],
                  ),
                    SizedBox(height: 5,),
                    Divider(height: 10, thickness: 0.7, color: Colors.grey.withValues(alpha: 0.5)),
                  // Dynamic Calendar Days Grid
                  GridView.builder(
                    shrinkWrap: true, // Important for GridView inside Column/SingleChildScrollView
                    physics: const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7, // 7 days a week
                      childAspectRatio: 1.1, // Make cells square
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    ),
                    itemCount: days.length,
                    itemBuilder: (context, index) {
                      final DateTime day = days[index];
                      final bool isCurrentMonth = day.month == _focusedDay.month;
                      final bool isSelected = _selectedDate.year == day.year &&
                          _selectedDate.month == day.month &&
                          _selectedDate.day == day.day;

                      return _buildCalendarDay(day, isSelected, isCurrentMonth);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            // Select Time
            const Text(
              'Select Time:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTimeSlot('12 PM'),
                  const SizedBox(width: 8),
                  _buildTimeSlot('03 PM'),
                  const SizedBox(width: 8),
                  _buildTimeSlot('06 PM'),
                  const SizedBox(width: 8),
                  _buildTimeSlot('09 PM'),
                  const SizedBox(width: 8),
                  // Add more time slots as needed
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Guest Count
            const Text(
              'Guest:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.remove, color: Colors.white,size: 16,),
                      onPressed: () {
                        setState(() {
                          if (_guestCount > 1) {
                            _guestCount--;
                            _guestController.text = _guestCount.toString();
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _guestController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.black26), // Light black border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.black45, width: 1.5),
                          ),
                          filled: true,
                          fillColor: Colors.white, // White background
                          contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _guestCount = int.tryParse(value) ?? 1;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.orange, // Use orange for the plus button
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white,size: 16,),
                      onPressed: () {
                        setState(() {
                          _guestCount++;
                          _guestController.text = _guestCount.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            // Book Now Button
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle book now
                  print('Selected Date: $_selectedDate');
                  print('Selected Time: $_selectedTime');
                  print('Guest Count: $_guestCount');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}