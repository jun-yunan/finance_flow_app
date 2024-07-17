import 'package:flutter/material.dart';

class LabelItem extends StatefulWidget {
  const LabelItem({super.key});

  @override
  State<LabelItem> createState() => _LabelItemState();
}

enum LabelType { daily, weekly, monthly }

class _LabelItemState extends State<LabelItem> {
  LabelType _selected = LabelType.daily;
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<LabelType>(
      segments: const [
        ButtonSegment<LabelType>(value: LabelType.daily, label: Text("Daily")),
        ButtonSegment<LabelType>(
            value: LabelType.weekly, label: Text("Weekly")),
        ButtonSegment<LabelType>(
            value: LabelType.monthly, label: Text("Monthly")),
      ],
      selected: <LabelType>{_selected},
      onSelectionChanged: (Set<LabelType> newSelection) {
        setState(() {
          _selected = newSelection.first;
        });
      },
    );
  }
}
