// lib/notification_service.dart

import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:maps_and_themeing/second_screen.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;

// (1) إنشاء كائن الملاحة العام
// هذا المفتاح سيسمح لنا بالتنقل (Navigate) من خارج شجرة الـ Widget
// (مفيد للتعامل مع نقرات الإشعار عندما يكون التطبيق مغلقًا)
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NotificationService {
  // (2) إنشاء كائن الحزمة
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // (3) دالة التهيئة (Initialization)
  static Future<void> init() async {
    // تحميل بيانات المناطق الزمنية (مهم للإشعارات المجدولة)
    tzdata.initializeTimeZones();

    // إعدادات أندرويد - نستخدم اسم الأيقونة 'app_icon'
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_notification');

    // إعدادات iOS 
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    // إعدادات عامة
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    // (4) تشغيل الحزمة مع تحديد دالة للتعامل مع النقرات
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // هذه الدالة تعمل عندما يضغط المستخدم على الإشعار
      onDidReceiveNotificationResponse: onNotificationTap,
    );
  }

  // (5) دالة طلب الأذونات
  static Future<void> requestPermissions() async {
    // طلب إذن أندرويد 13+
final context = navigatorKey.currentContext;
if (context != null && Theme.of(context).platform == TargetPlatform.android) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      await androidImplementation?.requestNotificationsPermission();
    }

    // طلب إذن iOS (سيظهر تلقائيًا في أول مرة مع إعدادات التهيئة)
  }

  // (6) دالة التعامل مع نقرة الإشعار
  static void onNotificationTap(NotificationResponse response) {
    if (response.payload != null && response.payload!.isNotEmpty) {
      print('Notification Payload: ${response.payload}');
   
      // استخدام المفتاح العام للانتقال للشاشة الثانية
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => SecondScreen(payload: response.payload!),
        ),
      );
    }
  }

  // (7) تفاصيل الإشعار (القناة)
  // نجهزها مرة واحدة لإعادة استخدامها
  static const NotificationDetails _notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'main_channel_id', 
      'Main Channel', // اسم القناة
      channelDescription: 'Channel for main app notifications',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      icon: '@drawable/ic_notification',
    ),
    iOS: DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    ),
  );

  // (8) دالة إظهار إشعار فوري
  static Future<void> showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    await flutterLocalNotificationsPlugin.show(
      0, // ID الإشعار
      title,
      body,
      _notificationDetails,
      payload: payload,
    );
  }

  // (9) دالة إظهار إشعار مجدول
  static Future<void> showScheduledNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      1, // ID فريد ومختلف
      title,
      body,
      // حساب الوقت: الآن + 5 ثوانٍ
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      _notificationDetails,
      payload: payload,
      // تحديد التعامل مع التوقيت الصيفي
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}