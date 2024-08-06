import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_flow_app/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

enum TimeFrame { daily, weekly, monthly }

class HomeController extends GetxController {
  @override
  void onClose() {
    // TODO: implement onClose

    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getUid();
    super.onInit();
  }

  final Rx<TimeFrame> selectedTimeFrame = Rx<TimeFrame>(TimeFrame.daily);

  final Rx<UserModel?> user = Rx<UserModel?>(null);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  final Rx<String> _uid = Rx<String>('');

  void getUid() {
    _uid.value = _auth.currentUser!.uid;
    update();
  }

  void setSelectedTimeFrame(TimeFrame timeFrame) {
    selectedTimeFrame.value = timeFrame;
    update();
  }

  Stream<DocumentSnapshot> get userStream =>
      _database.collection('users').doc(_uid.value).snapshots();
}
