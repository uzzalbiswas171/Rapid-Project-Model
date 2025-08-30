import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';

class SuccessDeliveryPercelOnTime extends StatefulWidget {
  const SuccessDeliveryPercelOnTime({super.key});

  @override
  State<SuccessDeliveryPercelOnTime> createState() =>
      _SuccessDeliveryPercelOnTimeState();
}

class _SuccessDeliveryPercelOnTimeState extends State<SuccessDeliveryPercelOnTime> {
  final TextEditingController _feedbackController = TextEditingController();
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Delivery illustration
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle
                            ,color: ColorConst.baseColor.withValues(alpha: 0.3)),
                      ),
                      Positioned(
                        bottom: 33,
                        child: Container(
                        height: 300-66,
                        width: 300-66,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle
                            ,color: ColorConst.baseColor),
                      ),

                      ),
                      Positioned(
                        bottom: 20,
                          child: Container(
                        height: 240,
                          width: 200,
                        decoration:BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                ImageConst.deliveryBike),
                            fit: BoxFit.contain
                          ),
                        ),
                      )),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Title section
                  Text(
                    'Hooray!',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Enjoy Your ',
                          style: theme.textTheme.titleMedium,
                        ),
                        TextSpan(
                          text: 'Meal',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Feedback box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF5DB),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tell More About Our Service',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _feedbackController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: 'Type here...',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(child: _buildStarRating()),

                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submitFeedback,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final isSelected = index < _rating;
        return IconButton(
          icon: Icon(
            isSelected ? Icons.star : Icons.star_border,
            color: Colors.orange,
            size: 28,
          ),
          onPressed: () => setState(() => _rating = index + 1),
        );
      }),
    );
  }

  void _submitFeedback() {
    final feedback = _feedbackController.text.trim();
    final rating = _rating;

    if (rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a rating')),
      );
      return;
    }

    // Example print, you can replace this with real logic/API
    print('Rating: $rating');
    print('Feedback: $feedback');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thanks for your feedback!')),
    );
  }
}
