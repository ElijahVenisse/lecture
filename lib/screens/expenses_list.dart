import 'package:flutter/material.dart';
import 'package:lecture/components/expenses_entry.dart';
import 'package:lecture/components/expenses_list_view.dart';
import 'package:lecture/models/expenses_item.dart';

class ExpensesListScreen extends StatefulWidget {
  ExpensesListScreen({super.key});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  List<ExpensesItem> _expensesList = [
    ExpensesItem(
      description: 'rental',
      amount: 5000,
      date: DateTime.now(),
    ),
    ExpensesItem(
      description: 'rental',
      amount: 5000,
      date: DateTime.now(),
    ),
  ];

  void showExpensesEntry() {
    showModalBottomSheet(
      context: context,
      builder: (_) => ExpensesEntry(),
    );
  }

  // void addExpensesItem(Ex) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses'),
        actions: [
          IconButton(
            onPressed: () {
              showExpensesEntry();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Text('ADD'),
          // ),
          Expanded(child: ExpensesListView(expensesList: _expensesList)),
        ],
      ),
    );
  }
}
