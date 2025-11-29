import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  void firebasemessaging() async {
    //initializedd firebase messaging
    //getting the instance so later we can use the services inside firebase messaging
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    //FCM token
    String? token = await messaging.getToken();
    print("FCM Token : $token");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
