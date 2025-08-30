import 'package:flutter/material.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:get_storage/get_storage.dart';

// This is the main widget for the Filter screen.
class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Define the available dietary preferences.
  final List<String> _dietaryPreferences = [
    'Gluten-Free',
    'Vegan',
    'Non Veg',
    'Healthy',
    'Low Carb',
    'Spicy',
    'No Fat',
    'High Protein',
  ];

  // Define the available kitchen types.
  final List<String> _kitchenTypes = [
    'Italian',
    'Arabian',
    'Chinese',
    'American',
    'Asian',
    'Fast Food',
    'Indian',
    'Drinks',
  ];

  // Keep track of selected dietary preferences. Using a Set for efficient lookup.
  Set<String> _selectedDietaryPreferences = {};
  // Keep track of selected kitchen types.
  Set<String> _selectedKitchenTypes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body is wrapped in a Column to arrange elements vertically.
      body: Column(
        children: [
          // Custom AppBar-like header for the filters screen.
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                // Close button (X icon).
                IconButton(
                  icon: const Icon(Icons.close, size: 28, color: Colors.black54),
                  onPressed: () {
                  },
                ),
              ],
            ),
          ),
          // A thin line separator.
          Container(
            height: 1.0,
            color: Colors.grey[300],
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
          ),
          // Expanded widget to make the filter options scrollable if needed.
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dietary Preference Section.
                  const Text(
                    'Dietary Preference',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Wrap widget for flexible chip layout.
                  Wrap(
                    spacing: 8.0, // Horizontal space between chips.
                    runSpacing: 8.0, // Vertical space between lines of chips.
                    children: _dietaryPreferences.map((preference) {
                      // FilterChip allows multiple selections.
                      return FilterChip(
                        label: Text(preference),
                        selected: _selectedDietaryPreferences.contains(preference),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedDietaryPreferences.add(preference);
                            } else {
                              _selectedDietaryPreferences.remove(preference);
                            }
                          });
                        },
                        // Styling for the chip.
                        selectedColor: Colors.amber[200], // Color when selected.
                        checkmarkColor: Colors.black87, // Checkmark color.
                        labelStyle: TextStyle(
                          color: _selectedDietaryPreferences.contains(preference)
                              ? Colors.black87
                              : Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                        backgroundColor: Colors.grey[100], // Background color when not selected.
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: _selectedDietaryPreferences.contains(preference)
                                ? Colors.amber
                                : Colors.grey[300]!,
                            width: 1.0,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24), // Space between sections.

                  // Kitchen Section.
                  const Text(
                    'Kitchen',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: _kitchenTypes.map((kitchen) {
                      return FilterChip(
                        label: Text(kitchen),
                        selected: _selectedKitchenTypes.contains(kitchen),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedKitchenTypes.add(kitchen);
                            } else {
                              _selectedKitchenTypes.remove(kitchen);
                            }
                          });
                        },
                        selectedColor: Colors.amber[200],
                        checkmarkColor: Colors.black87,
                        labelStyle: TextStyle(
                          color: _selectedKitchenTypes.contains(kitchen)
                              ? Colors.black87
                              : Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                        backgroundColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: _selectedKitchenTypes.contains(kitchen)
                                ? Colors.amber
                                : Colors.grey[300]!,
                            width: 1.0,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          // Apply Button at the bottom.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSubmitButton(text: "Apply", onPressed: () {

            },),
          )
        ],
      ),
    );
  }
}
