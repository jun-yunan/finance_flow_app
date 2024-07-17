import 'package:finance_flow_app/controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SegmentedTimeFrame extends StatelessWidget {
  const SegmentedTimeFrame({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Obx(
      () => SegmentedButton<TimeFrame>(
        showSelectedIcon: false,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return const Color(0xff00D09E); // Màu nền khi được chọn
            }
            return const Color(0xffDFF7E2); // Màu nền khi không được chọn
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white; // Màu văn bản khi được chọn
            }
            return Colors.black; // Màu văn bản khi không được chọn
          }),
          side: WidgetStateProperty.all<BorderSide>(BorderSide.none),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        segments: const [
          ButtonSegment<TimeFrame>(
            value: TimeFrame.daily,
            label: Text("Daily"),
          ),
          ButtonSegment<TimeFrame>(
            value: TimeFrame.weekly,
            label: Text("Weekly"),
          ),
          ButtonSegment<TimeFrame>(
            value: TimeFrame.monthly,
            label: Text("Monthly"),
          ),
        ],
        selected: <TimeFrame>{homeController.selectedTimeFrame.value},
        onSelectionChanged: (Set<TimeFrame> newSelection) {
          homeController.setSelectedTimeFrame(newSelection.first);
        },
      ),
    );
  }
}
