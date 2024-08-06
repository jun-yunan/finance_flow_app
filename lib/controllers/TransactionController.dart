import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_flow_app/models/Transaction.dart';
import 'package:finance_flow_app/utils/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TransactionType {
  income,
  expense,
}

class TransactionController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    getUid();
    // await getListTransaction();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  final FirebaseFirestore _database = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rx<String> _uid = Rx<String>('');

  final title = Rx<TextEditingController>(TextEditingController());
  final amount = Rx<TextEditingController>(TextEditingController());
  final date = Rx<TextEditingController>(TextEditingController());
  // final category = Rx<TextEditingController>(TextEditingController());

  final Rx<String?> category = Rx<String?>(null);
  final transactionType = Rx<TransactionType?>(null);

  final Rx<bool> isActiveButtonIncome = Rx<bool>(true);
  final Rx<bool> isActiveButtonExpense = Rx<bool>(false);

  final RxList<TransactionModel> transactionList = RxList<TransactionModel>([]);

  void getUid() {
    _uid.value = _auth.currentUser!.uid;
    update();
  }

  void resetFormAddTransaction() {
    title.value.clear();
    amount.value.clear();
    date.value.clear();
    category.value = null;
    transactionType.value = null;
    isActiveButtonIncome.value = true;
    isActiveButtonExpense.value = false;
    update();
  }

  Stream<List<TransactionModel>> transactionsStream() {
    return _database
        .collection('transactions')
        .where('userId', isEqualTo: _uid.value)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TransactionModel.fromJson(doc.data()))
            .toList());
  }

  Future<void> addTransaction(BuildContext context) async {
    try {
      final TransactionModel transaction = TransactionModel(
        amount: amount.value.text.isEmpty ? 0 : double.parse(amount.value.text),
        category: category.value!,
        date: DateTime.parse(date.value.text),
        title: title.value.text,
        transactionType: transactionType.value == TransactionType.income
            ? 'income'
            : 'expense',
        userId: _uid.value,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await _database
          .collection('transactions')
          .add(transaction.toJson())
          .then((value) async {
        await _database.collection("transactions").doc(value.id).update({
          'id': value.id,
        });
        await _database.collection('users').doc(_uid.value).update({
          'transactionIds': FieldValue.arrayUnion([value.id])
        });

        if (transaction.transactionType == "income") {
          await _database.collection('users').doc(_uid.value).update({
            'balance': FieldValue.increment(transaction.amount),
          });
        } else {
          await _database.collection('users').doc(_uid.value).update({
            'balance': FieldValue.increment(-transaction.amount),
          });
        }

        resetFormAddTransaction();
        print('Transaction added');
        showSnackbar(
            message: "Add Transaction Success", style: SnackBarStyle.success);
        Navigator.of(context).pop();
      }).catchError((error) {
        showSnackbar(message: error.toString(), style: SnackBarStyle.error);
        print(error);
      });
    } catch (e) {
      print(e);
      showSnackbar(message: "Something went wrong", style: SnackBarStyle.error);
    }
  }

  Future<void> getListTransaction() async {
    try {
      // final List<TransactionModel> transactions = [];
      final snapshot = await _database
          .collection('transactions')
          .where('userId', isEqualTo: _uid.value)
          .get();
      snapshot.docs.forEach((element) {
        transactionList.add(TransactionModel.fromJson(element.data()));
      });
      print(transactionList.length);
    } catch (e) {
      print(e);
    }
  }
}
