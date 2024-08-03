import 'dart:io';
import 'package:finance_flow_app/components/profile/form-edit-profile.dart';
import 'package:finance_flow_app/controllers/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit My Profile",
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
                child: const FormEditProfile(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Obx(
                      () => Container(
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
                        child: profileController.image.value != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.file(
                                  File(profileController.image.value!.path),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                  'assets/images/avatar-default.png',
                                ),
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: IconButton(
                        onPressed: () async {
                          await profileController.pickImage();
                        },
                        icon: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
