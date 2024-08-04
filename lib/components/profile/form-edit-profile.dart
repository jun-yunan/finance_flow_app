import 'package:finance_flow_app/components/button/button-custom.dart';
import 'package:finance_flow_app/components/profile/field-input.dart';
import 'package:finance_flow_app/components/profile/switch-toggle.dart';
import 'package:finance_flow_app/controllers/ProfileController.dart';
import 'package:finance_flow_app/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormEditProfile extends StatelessWidget {
  const FormEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final dateOfBirthController = TextEditingController();

    return StreamBuilder(
      stream: profileController.getProfileStream(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
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
        final UserModel user = UserModel.fromJson(snapshot.data.data());
        nameController.text = user.name;
        emailController.text = user.email;
        phoneController.text = user.mobileNumber;
        dateOfBirthController.text = user.dateOfBirth.toString();

        return ListView(
          children: [
            Column(
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
            ),
            const SizedBox(height: 33),
            const Text(
              "Account Settings",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 30),
            FieldInput(
              label: "Username",
              controller: nameController,
            ),
            FieldInput(
              label: "Email Address",
              controller: emailController,
              readOnly: true,
            ),
            FieldInput(label: "Phone", controller: phoneController),
            FieldInput(
              label: "Date Of Birth",
              controller: dateOfBirthController,
              readOnly: true,
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((value) {
                  dateOfBirthController.text = value.toString();
                });
              },
            ),
            Obx(
              () => SwitchToggle(
                value: profileController.isPushNotification.value,
                onChanged: (value) {
                  profileController.togglePushNotification(value);
                },
              ),
            ),
            Obx(
              () => SwitchToggle(
                value: profileController.isDarkMode.value,
                onChanged: (value) {
                  profileController.toggleDarkMode(value);
                },
              ),
            ),
            const SizedBox(height: 20),
            ButtonCustom(
              title: "Update Profile",
              variant: ButtonVariant.primary,
              onPressed: () async {
                await profileController.updateProfile(
                  name: nameController.text,
                  dateOfBirth: dateOfBirthController.text,
                  mobileNumber: phoneController.text,
                );
              },
            )
          ],
        );
      },
    );
  }
}
