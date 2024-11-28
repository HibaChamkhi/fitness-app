import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ActivityTrackerWidget extends StatefulWidget {
  const ActivityTrackerWidget({super.key});

  @override
  State<ActivityTrackerWidget> createState() => _ActivityTrackerWidgetState();
}

class _ActivityTrackerWidgetState extends State<ActivityTrackerWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Activity Tracker",
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
          ],
        ),
      ),
    );
  }
}
