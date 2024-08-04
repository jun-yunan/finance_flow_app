import 'package:finance_flow_app/controllers/AuthController.dart';
import 'package:finance_flow_app/controllers/ProfileController.dart';
import 'package:finance_flow_app/models/UserModel.dart';
import 'package:finance_flow_app/screens/profile/edit-profile/edit-profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final ProfileController profileController = Get.put(ProfileController());
    // final UserModel user = UserModel.fromJson(
    //     profileController.userStream.value?.data() as Map<String, dynamic>);
    // profileController.updateUser(user);
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
                    StreamBuilder(
                      stream: profileController.getProfileStream(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text(
                            'Something went wrong',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ));
                        }
                        final UserModel user =
                            UserModel.fromJson(snapshot.data.data());
                        return Column(
                          children: [
                            const SizedBox(height: 50),
                            Text(
                              user.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "ID: ${user.id}",
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
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
                      onTap: () {
                        Get.to(() => const EditProfile());
                      },
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
                      leading: Container(
                        width: 57,
                        height: 53,
                        decoration: BoxDecoration(
                          color: const Color(0xff6cb5fd),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        // child: SvgPicture.asset(
                        //   'assets/icons/help_icon.svg',
                        //   width: 10,
                        //   height: 10,
                        // ),
                        child: const Icon(
                          size: 36,
                          Icons.help_outline,
                          color: Colors.white,
                        ),
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
                        Get.dialog(
                          AlertDialog(
                            title: const Text("Logout"),
                            content:
                                const Text("Are you sure you want to logout?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  authController.signOut(context);
                                  Get.delete<ProfileController>();
                                  // Get.delete<AuthController>();
                                },
                                child: const Text("Logout"),
                              ),
                            ],
                          ),
                        );
                        // authController.signOut(context);
                        // Get.delete<ProfileController>();
                        // Get.delete<AuthController>();
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
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: StreamBuilder(
                    stream: profileController.getProfileStream(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: const CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            'assets/images/avatar-default.png',
                          ),
                        );
                      }

                      if (snapshot.hasData) {
                        final UserModel user =
                            UserModel.fromJson(snapshot.data?.data());

                        // profileController.user.value = user;
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: user.avatar.isNotEmpty
                              ? Image.network(
                                  user.avatar,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/avatar-default.png',
                                  fit: BoxFit.cover,
                                ),
                        );
                      }

                      return const SizedBox();
                    },
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
