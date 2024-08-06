import 'package:finance_flow_app/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    String assetsCategory = "";

    switch (transaction.category) {
      case 'Entertainment':
        assetsCategory = 'assets/icons/category/Entertainment.svg';
        break;
      case 'Food':
        assetsCategory = 'assets/icons/category/Food.svg';
        break;
      case 'Gift':
        assetsCategory = 'assets/icons/category/Gift.svg';
        break;
      case 'Groceries':
        assetsCategory = 'assets/icons/category/Groceries.svg';
        break;
      case 'Medicine':
        assetsCategory = 'assets/icons/category/Medicine.svg';
        break;
      case 'Rent':
        assetsCategory = 'assets/icons/category/Rent.svg';
        break;
      case 'Salary':
        assetsCategory = 'assets/icons/category/Salary.svg';
        break;
      case 'Saving':
        assetsCategory = 'assets/icons/category/Saving.svg';
        break;
      case 'Shopping':
        assetsCategory = 'assets/icons/category/Shopping.svg';
        break;
      case 'Transport':
        assetsCategory = 'assets/icons/category/Transport.svg';
        break;
      default:
        assetsCategory = '';
        break;
    }

    print(assetsCategory);
    print(transaction.date.runtimeType);

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16),
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xffDFF7E2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            assetsCategory,
            width: 57,
            height: 53,
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.category,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                DateFormat('dd MMM yyyy').format(transaction.date),
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0068FF)),
              )
            ],
          ),
          const SizedBox(width: 16),
          const VerticalDivider(
            color: Color(0xff00D09E),
            thickness: 2,
            width: 1,
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(width: 16),
          Text(
            transaction.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 16),
          const VerticalDivider(
            color: Color(0xff00D09E),
            thickness: 2,
            width: 1,
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(width: 16),
          Text(
            "${transaction.transactionType == 'income' ? '\$' : '-\$'}${transaction.amount}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
