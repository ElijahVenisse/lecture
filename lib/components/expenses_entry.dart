import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class ExpensesEntry extends StatefulWidget {
   ExpensesEntry({super.key});

  // Function(ExpensesIitem item) {}

  @override
  State<ExpensesEntry> createState() => _ExpensesEntryState();
}

class _ExpensesEntryState extends State<ExpensesEntry> {
  TextEditingController desController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  DateTime? selectedDate;

  void dismissEntry() {
    Navigator.pop(context);
  }

  void showSelectDate() async {
    var now = DateTime.now();
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(now.year - 1, 1, 1),
      lastDate: DateTime(now.year, 12, 31),
    );

    selectedDate = date;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          TextField(
            controller: desController,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
          ),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Amount',
              prefix: Text('₱ '),
            ),
          ),
          Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  showSelectDate();
                },
                icon: Icon(Icons.calendar_month),
                label: Text(
                  selectedDate == null
                      ? 'Select Date'
                      : ('${DateFormat.yMd().format(selectedDate!)}'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  dismissEntry();
                },
                child: Text('Cancel'),
              ),
              const Gap(20),
              ElevatedButton(onPressed: () {}, child: Text('Add')),
            ],
          ),
        ],
      ),
    );
  }
}
