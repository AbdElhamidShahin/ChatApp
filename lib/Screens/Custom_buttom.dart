import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  CustomButon({super.key, this.text, this.onTap});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String? text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white), // background color
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // circular border
                  side: const BorderSide(
                      color: Color(0xff22B475E)), // border color
                ),
              ),
            ),
            onPressed: onTap,
            child: Text(
              text!,
              style: TextStyle(
                  color: Color(0xff22B475E), fontSize: 20), // text color
            ),
          ),
        ),
      ),
    );
  }
}
