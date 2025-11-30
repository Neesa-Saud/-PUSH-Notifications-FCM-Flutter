import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notiapp/screen/notification_detail_screen.dart';

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
    //When app is open
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      String title = message.notification?.title ?? "N/A";
      String body = message.notification?.body ?? "N/A";
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(
            body,
            maxLines: 1,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
            ), //if test exceeds then it put .....
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NotificationDetailScreen(body: body, title: title),
                  ),
                );
              },
              child: Text("Next"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        ),
      );
    });
    //when app is not closed but is in the background
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final title = message.notification?.title ?? "N/A";
      final body = message.notification?.body ?? "N/A";
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              NotificationDetailScreen(body: body, title: title),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
