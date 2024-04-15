import 'package:expense_tracker/components/chart.dart';
import 'package:expense_tracker/components/expense_list.dart';
import 'package:expense_tracker/components/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter course',
        amount: 50,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: ' Cinema',
        amount: 40,
        date: DateTime.now(),
        category: Category.leisure),
  ];
  void _openAddExpensesOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (_) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final exoenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.deepPurple[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
      content: const Text(
        'Expenses deleted!',
        style: TextStyle(color: Colors.white),
      ),
      action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(exoenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Widget mainContent =
        const Center(child: Text('No Expense Found. Start adding some!'));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
          expenseList: _registeredExpenses, onRemovedExpense: _removeExpense);
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Expense Tracker'),
          actions: [
            IconButton(
                onPressed: _openAddExpensesOverlay, icon: const Icon(Icons.add))
          ],
        ),
        body: screenWidth < 600
            ? Column(
                children: [
                  Chart(expenses: _registeredExpenses),
                  Expanded(child: mainContent)
                ],
              )
            : SafeArea(
                child: Row(
                  children: [
                    Expanded(child: Chart(expenses: _registeredExpenses)),
                    Expanded(child: mainContent)
                  ],
                ),
              ));
  }
}
