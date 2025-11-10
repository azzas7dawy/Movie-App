// lib/second_screen.dart

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String payload;
  static const routeName = '/second_screen';

  const SecondScreen({Key? key, required this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الشاشة الثانية'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('تم فتح الإشعار بنجاح!'),
            SizedBox(height: 20),
            Text(
              'البيانات المرسلة (Payload):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              payload,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
            Navigator.pushNamed(context, PushNotificationScreen.routeName);
              },
              child: Text('go to push notification screen'),
            ),
          ],
        ),
      ),
    );
  }
}