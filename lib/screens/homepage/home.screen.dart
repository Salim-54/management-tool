import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:management_tool/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../items/items.screen.dart';
import '../profile/profile.screen.dart';
import '../requests/request.screen.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _mainScreens = const [
    Body(),
    RequestScreen(),
    ItemsScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            height: double.infinity,
            padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://avatars.githubusercontent.com/u/81898585?s=400&u=50c9f65d60376117744cc16bbd027833b4fdaadd&v=4',
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Good morning',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // const SizedBox(height: 2),
                          Text(
                            Provider.of<AuthProvider>(context, listen: false)
                                    .name ??
                                'Junior Rurangwa',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColor.pBlue,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SvgPicture.asset(
                  "assets/icons/notification.svg",
                  width: 22,
                  height: 22,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // alignment: Alignment.center,
        height: 66,
        // margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 20.0,
              offset: const Offset(0.0, -1.0),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: AppColor.pGrey,
              ),
              label: 'Clients',
              activeIcon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: AppColor.pBlue,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/request.svg",
                color: AppColor.pGrey,
              ),
              label: 'Requests',
              activeIcon: SvgPicture.asset(
                "assets/icons/request.svg",
                color: AppColor.pBlue,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/edit.svg",
                color: AppColor.pGrey,
              ),
              label: 'Items',
              activeIcon: SvgPicture.asset(
                "assets/icons/edit.svg",
                color: AppColor.pBlue,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/profile.svg",
                color: AppColor.pGrey,
              ),
              label: 'Profile',
              activeIcon: SvgPicture.asset(
                "assets/icons/profile.svg",
                color: AppColor.pBlue,
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _mainScreens,
      ),
    );
  }
}
