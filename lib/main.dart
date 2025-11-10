import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:maps_and_themeing/cloude_notification.dart';
import 'package:maps_and_themeing/features/home_screen/data/datasources/remotly/movie_service.dart';
import 'package:maps_and_themeing/features/home_screen/data/repos/movie_repo.dart';
import 'package:maps_and_themeing/features/home_screen/presentation/cubits/movie_cubit.dart';
import 'package:maps_and_themeing/features/home_screen/presentation/pages/movies_screen.dart';
import 'package:maps_and_themeing/firebase_options.dart';
import 'package:maps_and_themeing/google_maps_screen.dart';
import 'package:maps_and_themeing/local_notification.dart';
import 'package:maps_and_themeing/second_screen.dart';
 Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main()async{
  
 WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp(
    
    options: DefaultFirebaseOptions.currentPlatform, // لو عندك firebase_options.dart
  );
  Firebase.initializeApp();
  // Firebase.ensureInitialized();
 
  await FirebaseMessaging.instance.getToken().then((token) {
    print("Firebase Messaging Token: $token");
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
 

//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@drawable/ic_notification'); // <-- اسم الأيقونة هنا
  
//   final notificationService = NotificationService();
//   await NotificationService.init();

// // 3. دمج الإعدادات
//   const InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     // iOS: initializationSettingsIOS,
//   );




  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MyHomePage(),
      initialRoute:MyHomePage.routeName,
      // PushNotificationScreen.routeName,
      navigatorKey: navigatorKey, 
      routes: {
        SecondScreen.routeName: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return SecondScreen(payload: args);
        },
        PushNotificationScreen.routeName: (context) => const PushNotificationScreen(),
        
      },
      // (2) تعيين مفتاح الملاحة

//        BlocProvider(
//   create: (context) => MovieCubit( 
//     MovieRepo(
//       MovieServices(
//         Dio(),
//       ),
//     ),
//   )..fetchMovies(),
//   child: const MovieListPage(),
// ),
 //MapScreen() ,
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
   
    NotificationService.requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Notifications Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // (6) زر لإظهار إشعار فوري
              ElevatedButton(
                onPressed: () {

                  NotificationService.showSimpleNotification(
                    title: 'إشعار فوري',
                    body: 'اشرب الماء',
                    payload: 'simple_notification_payload',
                    
                  );
                   Navigator.pushNamed(context, SecondScreen.routeName, arguments: 'simple_notification_payload');
              //  Navigator.pushNamed(context, '/second_screen', arguments: 'simple_notification_payload');
                },
                child: Text('إظهار إشعار فوري'),
              ),
              SizedBox(height: 20),
              
              // (7) زر لإظهار إشعار مجدول
              ElevatedButton(
                onPressed: () {
                  
                  NotificationService.showScheduledNotification(
                    title: 'إشعار مجدول',
                    body: 'سيظهر هذا الإشعار بعد 5 ثوانٍ.',
                    payload: 'scheduled_notification_payload',
                  );
                  // إظهار رسالة بسيطة للمستخدم
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('تم جدولة الإشعار بعد 5 ثوانٍ!')),
                  );
                  Navigator.pushNamed(context, SecondScreen.routeName, arguments: 'scheduled_notification_payload');
                },
                child: Text('إظهار إشعار مجدول (بعد 5 ثوانٍ)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}