import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class HomePage extends StatelessWidget {
  final NotchBottomBarController? controller;

  const HomePage({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TODO: Date'),
                  IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
                ],
            ),
              SizedBox(height: 20),
              Text("Quote of the day:"),
              Text("“Do the best you can until you know better. Then when you know better, do better.”"),
              Text("— Maya Angelou"),

              SizedBox(height: 20),
              Text("Reminders"),
              SizedBox(height: 10),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFF4A4A4A),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              SizedBox(height: 20),
              Text("Recent Activity"),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFF4A4A4A),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text("Activity ${index + 1}"),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}