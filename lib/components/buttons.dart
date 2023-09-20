import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final Function onPressed;

  final String text;
  const GlobalButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
          // Navigator.of(context).pop();
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFF1A74E2)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
