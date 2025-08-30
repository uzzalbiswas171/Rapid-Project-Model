import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Views/CustomWidget/CustomButton/custom_button.dart';
import 'package:rapid_super_market/Views/CustomWidget/TextWigget/text_widget.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/CartScreen/PaymentMethod/payment_successfull.dart';
class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController controller= TextEditingController();
  TextEditingController toController= TextEditingController();
  TextEditingController exp2= TextEditingController();
  TextEditingController exp1= TextEditingController();
  TextEditingController cvc= TextEditingController();
  @override
  void initState() {
    controller.text= "John Doe"; // Example default value
    toController.text= "4555 ---- ---- ----"; // Example default value
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Card",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
        child : Image.asset(
            ImageConst.crossIcon,
            height: 20,
            width: 20,
            color: Colors.black87,
          ),
        ),
      ),
      body:  Container(
        width: w,
        height: h,
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            _widgetRow(title: "card holder name",controller:controller ,hintText: "Enter card holder name"),
            SizedBox(height: 20),
            _widgetRow(title: "Card number",controller:toController, hintText: "Enter card number"),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(child: ExpireDateInputField(),),
                  SizedBox(width: 10),
                  Expanded(child:  _widgetRow(title: "CVC",controller:cvc,hintText:"***"),),
                ],
              ),
            ),
            Spacer(),
            CustomSubmitButton(text: "Add & Make Payment", onPressed: () {
              debugPrint("Add & Make Payment");
              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSuccessfulScreen()));
            },)
          ],
        ),
      )
    );
  }
}


Widget _widgetRow({
  required String title,
  required String hintText,
  required TextEditingController controller,
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextWidget.Text_16(text: title.toUpperCase(), color: Colors.black45, fontWeight: FontWeight.w400,letterSpacing: 0.3),
      SizedBox(height: 7),
      Container(
            height: 50,
            width: double.infinity,
              decoration: BoxDecoration(
              color: ColorConst.baseColor.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12, width: 1),
            ),

            alignment: Alignment.center,
            child: TextFormField(
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5
              ),
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10),
                hintText: "$hintText",
              ),
            ),
          ),
    ],
  );
}


class ExpireDateInputField extends StatefulWidget {
  const ExpireDateInputField({super.key});

  @override
  State<ExpireDateInputField> createState() => _ExpireDateInputFieldState();
}

class _ExpireDateInputFieldState extends State<ExpireDateInputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatExpireDate(String value) {
    // Remove all non-digit characters
    value = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (value.length >= 2) {
      final month = value.substring(0, 2);
      final remaining = value.substring(2);

      // Limit month to 12
      int monthInt = int.tryParse(month) ?? 1;
      if (monthInt > 12) monthInt = 12;

      value = monthInt.toString().padLeft(2, '0');

      if (remaining.isNotEmpty) {
        value += '/' + remaining;
      }
    }

    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget.Text_16(text: "EXPIRE DATE", color: Colors.black45, fontWeight: FontWeight.w400,letterSpacing: 0.3),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: ColorConst.baseColor.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black12, width: 1),
          ),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            maxLength: 7,
            inputFormatters: [
              LengthLimitingTextInputFormatter(7),
              FilteringTextInputFormatter.digitsOnly,
              TextInputFormatter.withFunction((oldValue, newValue) {
                final formatted = _formatExpireDate(newValue.text);
                return TextEditingValue(
                  text: formatted,
                  selection: TextSelection.collapsed(offset: formatted.length),
                );
              }),
            ],
            decoration: InputDecoration(
              counterText: '',
              hintText: 'mm/yyyy',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFFEFAEC),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
