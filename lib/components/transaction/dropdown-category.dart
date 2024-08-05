import 'package:finance_flow_app/controllers/TransactionController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DropdownCategory extends StatefulWidget {
  final String label;
  const DropdownCategory({super.key, required this.label});

  @override
  State<DropdownCategory> createState() => _DropdownCategoryState();
}

class _DropdownCategoryState extends State<DropdownCategory> {
  final TransactionController transactionController = Get.find();

  String? _selectedCategory;

  final List<Map<String, dynamic>> _listCategory = [
    {
      'name': 'Food',
      'icon': 'assets/icons/category/Food.svg',
    },
    {
      'name': 'Entertainment',
      'icon': 'assets/icons/category/Entertainment.svg',
    },
    {
      'name': 'Gift',
      'icon': 'assets/icons/category/Gift.svg',
    },
    {
      'name': 'Groceries',
      'icon': 'assets/icons/category/Groceries.svg',
    },
    {
      'name': 'Medicine',
      'icon': 'assets/icons/category/Medicine.svg',
    },
    {
      'name': 'Rent',
      'icon': 'assets/icons/category/Rent.svg',
    },
    {
      'name': 'Salary',
      'icon': 'assets/icons/category/Salary.svg',
    },
    {
      'name': 'Saving',
      'icon': 'assets/icons/category/Saving.svg',
    },
    {
      'name': 'Shopping',
      'icon': 'assets/icons/category/Shopping.svg',
    },
    {
      'name': 'Transport',
      'icon': 'assets/icons/category/Transport.svg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        // border: Border.all(color: Colors.grey),
        // color: const Color(0xffdff7e2),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: const Color(0xffdff7e2),
            ),
            child: Obx(
              () => DropdownButton(
                value: transactionController.category.value,
                hint: const Text(
                  'Select Category...',
                  style: TextStyle(
                    color: Color(0xffa5a5a5),
                    fontSize: 16,
                  ),
                ),
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                iconSize: 24,
                menuMaxHeight: 300,
                elevation: 16,
                borderRadius: BorderRadius.circular(22),
                dropdownColor: Colors.white,
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                items: _listCategory
                    .map((category) => DropdownMenuItem(
                          value: category["name"],
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                category["icon"],
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(width: 10),
                              Text(category["name"]),
                            ],
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  transactionController.category.value = value.toString();
                  print(transactionController.category.value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
