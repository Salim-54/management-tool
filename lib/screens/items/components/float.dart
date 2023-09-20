import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../splash/start.screen.dart';

class ReturnButton extends StatelessWidget {
  final Function onPressed;
  const ReturnButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 188,
      height: 41,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/return.svg',
            ),
            const SizedBox(width: 10),
            const Text(
              'RETURN ITEM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScanButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ScanButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 117,
      height: 58,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFF1A74E2)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: const Text(
          'SCAN NFC',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  final Function onPressed;
  const SaveButton({super.key, required this.onPressed});

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
        child: const Text(
          'Return Item',
          style: TextStyle(
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

class SaleButton extends StatelessWidget {
  final Function onPressed;
  final Color? color;
  final String? name;
  const SaleButton({super.key, this.color, this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              color ?? const Color(0xFF1A74E2)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
        child: Text(
          name ?? 'SALE',
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
