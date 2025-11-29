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
    FirebaseMessaging messaging = FirebaseMessaging.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
