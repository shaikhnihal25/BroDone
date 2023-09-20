import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String description;
  final double amount;

  Transaction(
      {required this.id, required this.description, required this.amount});
}

class TransactionProvider extends ChangeNotifier {
  List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void removeTransaction(String id) {
    _transactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }
}
