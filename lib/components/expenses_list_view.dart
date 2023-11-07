import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:lecture/models/expenses_item.dart';

class ExpensesListView extends StatelessWidget {
  ExpensesListView({super.key, required this.expensesList});

  List<ExpensesItem> expensesList;

  @override
  Widget build(BuildContext context) {
    var date_formatter = DateFormat.yMd();
    var currency_formatter =
        NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (_, index) => Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text('${expensesList[index].description}'),
              const Gap(15),
              Row(
                children: [
                  Text(
                      '${currency_formatter.format(expensesList[index].amount)}'),
                  const Spacer(),
                  Text('${date_formatter.format(expensesList[index].date)}'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
