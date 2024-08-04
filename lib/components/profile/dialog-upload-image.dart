import 'dart:io';

import 'package:finance_flow_app/components/button/button-custom.dart';
import 'package:finance_flow_app/controllers/ProfileController.dart';
import 'package:finance_flow_app/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUploadImage extends StatelessWidget {
  final String avatarUrl;
  const DialogUploadImage({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.upload),
              SizedBox(width: 10),
              Text("Upload Image"),
            ],
          ),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close))
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Please select image from gallery"),
          const SizedBox(height: 40),
          Obx(
            () => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
                backgroundImage: profileController.image.value != null
                    ? FileImage(File(profileController.image.value!.path))
                    : NetworkImage(avatarUrl),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await profileController.pickImage();
                },
                child: const Text("Gallery"),
              ),
              ElevatedButton(
                onPressed: () async {},
                child: const Text("Camera"),
              ),
            ],
          ),
        ],
      ),
      actions: [
        ButtonCustom(
          title: "Upload",
          variant: ButtonVariant.primary,
          onPressed: () async {
            await profileController
                .uploadImageToFirebaseStorage()
                .then((value) {
              showSnackbar(
                message: "Upload image successfully",
                style: SnackBarStyle.success,
              );
            });
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
