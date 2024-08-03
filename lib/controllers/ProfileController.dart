import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_flow_app/models/UserModel.dart';
import 'package:finance_flow_app/utils/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    await getUid();
    await getProfile();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  final Rx<String> uid = Rx<String>('');
  final Rx<UserModel?> user = Rx<UserModel?>(null);

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final Rx<bool> isPushNotification = Rx<bool>(false);
  final Rx<bool> isDarkMode = Rx<bool>(false);

  final ImagePicker imagePicker = ImagePicker();
  final Rx<XFile?> image = Rx<XFile?>(null);

  Future<void> pickImage() async {
    try {
      final XFile? pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      if (pickedImage != null) {
        image.value = pickedImage;
        update();
      }
    } catch (e) {
      showSnackbar(
          message: "Some thing went wrong!", style: SnackBarStyle.error);
      print(e);
    }
  }

  void togglePushNotification(bool value) {
    isPushNotification.value = value;
  }

  void toggleDarkMode(bool value) {
    isDarkMode.value = value;
  }

  Future<void> getUid() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        uid.value = user.uid;
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getProfile() async {
    try {
      final profile = await db.collection('users').doc(uid.value).get();
      if (profile.exists) {
        user.value = UserModel.fromJson(profile.data()!);
        update();
        print(user.value?.name);
      }
    } catch (e) {
      print(e);
    }
  }

  Stream<DocumentSnapshot> getProfileStream() {
    return db.collection('users').doc(uid.value).snapshots();
  }

  Future<void> updateProfile({
    required String name,
    required String dateOfBirth,
    required String mobileNumber,
  }) async {
    try {
      final UserModel userUpdate = UserModel(
        id: uid.value,
        email: user.value!.email,
        name: name,
        dateOfBirth: DateTime.parse(dateOfBirth),
        mobileNumber: mobileNumber,
        avatar: "",
        address: "",
        updatedAt: DateTime.now(),
        createdAt: user.value!.createdAt,
      );
      await db
          .collection('users')
          .doc(uid.value)
          .update(userUpdate.toJson())
          .then((value) {
        showSnackbar(
            message: "Update profile successfully",
            style: SnackBarStyle.success);
      }).onError((error, stackTrace) {
        showSnackbar(
            message: "Update profile failed!", style: SnackBarStyle.error);
      });
    } catch (e) {
      showSnackbar(
          message: "Some thing went wrong!", style: SnackBarStyle.error);
      print(e);
    }
  }
}
