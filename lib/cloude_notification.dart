import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationScreen extends StatefulWidget {
  const PushNotificationScreen({super.key});
  static const String routeName = '/pushNotification';

  @override
  State<PushNotificationScreen> createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {


 void initFirebaseMessaging() {
    FirebaseMessaging.instance.requestPermission();
    retriveToken();

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print('messageeeeeeeeeeeeeeeeeeee');
    //   print('Received a message while in the foreground!');
    //   print('Message data: ${message.data}');

    //   if (message.notification != null) {
    //     print('Message also contained a notification: ${message.notification}');
    //   }
    //       showDialog(
    //   context: context,
    //   builder: (_) => AlertDialog(
    //     title: Text(message.notification!.title ?? "No Title"),
    //     content: Text(message.notification!.body ?? "No Body"),
    //   ),
    // );
    // });
   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  // If `onMessage` is triggered with a notification, construct our own
  // local notification to show to users using the created channel.
  if (notification != null && android != null) {
    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@drawable/ic_notification',
            // other properties...
          ),
        ));
  }
});
    // Initialize Firebase Messaging and set up listeners for push notifications
  }
  void retriveToken() async {
    
    // Retrieve and print the FCM token for the device
    String? token = await FirebaseMessaging.instance.getToken();
    print("FCM Token: $token");
  }
  void configureAndroidNotificationChannel() async {
   
await flutterLocalNotificationsPlugin
  .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  ?.createNotificationChannel(channel);
  }
  
  
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.', // description
  importance: Importance.max,
);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFirebaseMessaging();

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Notification Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            initFirebaseMessaging();
          },
          child: const Text('Initialize Push Notifications'),
        ),
      ),
    );
  }
}