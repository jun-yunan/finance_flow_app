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
    super.onInit();
  }

  final Rx<TimeFrame> selectedTimeFrame = Rx<TimeFrame>(TimeFrame.daily);

  void setSelectedTimeFrame(TimeFrame timeFrame) {
    selectedTimeFrame.value = timeFrame;
    update();
  }
}
