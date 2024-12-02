import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'notification_item.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  final List<Map<String, String>> notifications = [
    {
      "title": "Hey, it’s time for lunch",
      "subtitle": "About 1 minute ago",
      "image": "assets/images/notif1.png",
    },
    {
      "title": "Don’t forget your meeting",
      "subtitle": "About 15 minutes ago",
      "image": "assets/images/notif2.png",
    },
    {
      "title": "Project deadline approaching",
      "subtitle": "About 2 hours ago",
      "image": "assets/images/notif3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 16,
                      )),
                ),
                const Text(
                  "Notification",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50)),
                  child: Image.asset("assets/icons/notifSettings.png"),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return Column(
                    children: [
                      NotificationItem(
                        title: notification['title'] ?? "",
                        subtitle: notification['subtitle'] ?? "",
                        image: notification['image'] ?? "",
                      ),
                      // Add Divider for all items except the last one
                      if (index != notifications.length - 1)
                        const Divider(thickness: 1,indent: 10,),
                    ],
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
