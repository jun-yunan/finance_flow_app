import 'package:finance_flow_app/controllers/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff00D09E),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_outlined,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Color(0xff00D09E),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
              ),
            ),
            Positioned(
              top: 100,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: Color(0xffF1FFF3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: ListView(
                  children: [
                    const Column(
                      children: [
                        SizedBox(height: 50),
                        Text(
                          "John Smith",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "ID: 25030024",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/profile_icon.svg',
                        width: 57,
                        height: 53,
                      ),
                      title: const Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/security_icon.svg',
                        width: 57,
                        height: 53,
                      ),
                      title: const Text(
                        "Security",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/setting_icon.svg',
                        width: 57,
                        height: 53,
                      ),
                      title: const Text(
                        "Setting",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/help_icon.svg',
                        width: 57,
                        height: 53,
                      ),
                      title: const Text(
                        "Help",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/logout_icon.svg',
                        width: 57,
                        height: 53,
                      ),
                      title: const Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        authController.signOut(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: Image.asset('assets/images/avatar-default.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
