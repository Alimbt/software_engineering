import 'package:flutter/material.dart';

class MyProjectScreen extends StatelessWidget {
  const MyProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: const Text(
          'پروژه‌های من',
          style: TextStyle(fontFamily: 'Vazir'),
        ),
      ),
      body: const Center(
        child: Text(
          'اینجا لیست پروژه‌های من است.',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Vazir',
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}