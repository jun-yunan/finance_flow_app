import 'package:finance_flow_app/components/home/transaction-item.dart';
import 'package:finance_flow_app/controllers/TransactionController.dart';
import 'package:finance_flow_app/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StreamBuilderTransaction extends StatelessWidget {
  const StreamBuilderTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionController = Get.find<TransactionController>();
    return StreamBuilder(
      stream: transactionController.transactionsStream(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data?.isEmpty) {
          return const Center(
            child: Text('No transactions yet'),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error occurred'),
          );
        }
        final List<TransactionModel> transactions = snapshot.data;
        // print(transactions[0].amount);
        return ListView.builder(
          itemCount: transactions.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return TransactionItem(
              transaction: transactions[index],
            );
          },
        );
      },
    );
  }
}
