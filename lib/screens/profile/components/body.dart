import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'logout.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Profile',
                style: TextStyle(
                  color: AppColor.sText,
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.network(
                          'https://avatars.githubusercontent.com/u/81898585?s=400&u=50c9f65d60376117744cc16bbd027833b4fdaadd&v=4',
                          width: 163,
                          height: 163,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'ADMINISTRATOR',
                        style: TextStyle(
                          color: AppColor.sText,
                          fontSize: 24,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const LogoutButton(),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

