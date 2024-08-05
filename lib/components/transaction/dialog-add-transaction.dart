import 'package:finance_flow_app/components/profile/field-input.dart';
import 'package:finance_flow_app/components/transaction/button-transaction-type.dart';
import 'package:finance_flow_app/components/transaction/dropdown-category.dart';
import 'package:finance_flow_app/controllers/TransactionController.dart';
import 'package:finance_flow_app/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogAddTransaction extends StatelessWidget {
  const DialogAddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    final TransactionController transactionController =
        Get.put(TransactionController());
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Add Transaction', style: TextStyle(fontSize: 20)),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            FieldInput(
              label: "Title",
              controller: transactionController.title.value,
              hintText: "Enter title...",
            ),
            const DropdownCategory(
              label: "Category",
            ),
            FieldInput(
              label: "Amount",
              controller: transactionController.amount.value,
              hintText: "\$ Enter amount...",
              keyboardType: TextInputType.number,
              suffixIcon: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff00d09e),
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.attach_money,
                  color: Colors.white,
                ),
              ),
            ),
            FieldInput(
              label: "Date",
              controller: transactionController.date.value,
              hintText: "Enter date...",
              readOnly: true,
              suffixIcon: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff00d09e),
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                ).then((value) {
                  transactionController.date.value.text =
                      value!.toString().substring(0, 10);
                }).catchError((error) {
                  print(error);
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Obx(() => ButtonTransactionType(
                        assetsIcon: "assets/icons/income.svg",
                        label: "Income",
                        isActive:
                            transactionController.isActiveButtonIncome.value,
                        onPressed: () {
                          // transactionController.isActiveButtonIncome.value =
                          //     !transactionController.isActiveButtonIncome.value;
                          transactionController.isActiveButtonIncome.value =
                              true;
                          transactionController.isActiveButtonExpense.value =
                              false;
                        },
                      )),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Obx(
                    () => ButtonTransactionType(
                      assetsIcon: "assets/icons/expense.svg",
                      label: "Expense",
                      isActive:
                          transactionController.isActiveButtonExpense.value,
                      onPressed: () {
                        // transactionController.isActiveButtonExpense.value =
                        //     !transactionController.isActiveButtonExpense.value;
                        transactionController.isActiveButtonExpense.value =
                            true;
                        transactionController.isActiveButtonIncome.value =
                            false;
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      actions: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () async {
              if (transactionController.isActiveButtonIncome.value) {
                transactionController.transactionType.value =
                    TransactionType.income;

                print("Selected Income");
              } else {
                transactionController.transactionType.value =
                    TransactionType.expense;
                print("Selected Expense");
              }
              if (transactionController.title.value.text.isEmpty ||
                  transactionController.amount.value.text.isEmpty ||
                  transactionController.date.value.text.isEmpty ||
                  transactionController.category.value == null) {
                showSnackbar(
                    message: "Enter all field.", style: SnackBarStyle.error);
              } else {
                // transactionController.addTransaction();
                await transactionController.addTransaction(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff00d09e),
              foregroundColor: Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: const Text(
              'Add Transaction',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }
}
