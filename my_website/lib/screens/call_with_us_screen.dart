import 'package:flutter/material.dart';

class CallWithUsScreen extends StatelessWidget {
  const CallWithUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: const Text(
          'تماس با ما',
          style: TextStyle(fontFamily: 'Vazir'),
        ),
      ),
      body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'برای تماس با من از اینجا اقدام کنید!',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Vazir',
                  color: Colors.white70,
                ),
              ),
               Text(
                'Email: alireza.afrang83@gmail.com',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Vazir',
                  color: Colors.white70,
                ),
              ),
               Text(
                'Phone: +989940786487',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Vazir',
                  color: Colors.white70,
                ),
              ),
            ],
                    ),
          ),
      );
  }
}