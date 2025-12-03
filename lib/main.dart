import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notiapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notiapp/screen/notification.dart'; //importing package for fcm

Future<void> _backgroundMessaging(
  RemoteMessage message,
) async {} //background msg handler
void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); //from firebase
  runApp(MyApp());
  FirebaseMessaging.onBackgroundMessage(
    _backgroundMessaging,
  ); //whenever msg arrive in background call _backgroundmessaging
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationScreen(),
    );
  }
}

