import 'package:flutter/material.dart';

import '../../core/ui/style/colors.dart';

class LatestActivityScreen extends StatelessWidget {
  const LatestActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest Activity",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "See more",
                style: TextStyle(
                  fontSize: 18,
                  color: AppConstants.grayChateau,
                ),
              ),
            ],
          ),
          SizedBox(height: 25,),
          Container(
            height: 200,
            child: Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  ActivityTile(
                    icon: "assets/images/LatestPic1.png",
                    title: 'Drinking 300ml Water',
                    time: 'About 3 minutes ago',
                    iconBackground: Colors.blue.shade100,
                  ),
                  SizedBox(height: 10),
                  ActivityTile(
                    icon: "assets/images/LatestPic2.png",
                    title: 'Eat Snack (Fitbar)',
                    time: 'About 10 minutes ago',
                    iconBackground: Colors.pink.shade100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  final String icon;
  final String title;
  final String time;
  final Color iconBackground;

  const ActivityTile({
    required this.icon,
    required this.title,
    required this.time,
    required this.iconBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade200)],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: iconBackground,
            child: Image.asset(icon),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.more_vert, color: Colors.grey),
        ],
      ),
    );
  }
}
