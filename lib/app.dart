import 'package:flutter/material.dart';

import 'screens/expenses.dart';
import 'utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: const Expenses(),
    );
  }
}
