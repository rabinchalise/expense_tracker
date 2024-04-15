import 'package:expense_tracker/components/expense_item.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenseList, required this.onRemovedExpense});

  final List<Expense> expenseList;
  final void Function(Expense expense) onRemovedExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (_, index) => Dismissible(
            direction: DismissDirection.endToStart,
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
              margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            ),
            onDismissed: (direction) {
              onRemovedExpense(expenseList[index]);
            },
            key: ValueKey(expenseList[index]),
            child: ExpenseItem(expense: expenseList[index])));
  }
}
