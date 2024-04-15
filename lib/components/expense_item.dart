import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/utils/extension.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              4.0.verticalSpacer,
              Row(
                children: [
                  Text('\$ ${expense.amount.toStringAsFixed(2)}'),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      8.0.hotizontalSpacer,
                      Text(expense.formmatedDate)
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
