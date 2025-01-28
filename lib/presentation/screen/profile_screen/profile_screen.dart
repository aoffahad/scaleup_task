import 'package:flutter/material.dart';
import 'package:scaleup_task/core/constant/text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff11161f),
      appBar: AppBar(
        title: const Text("App Guideline"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          children: [
            Text(
              "Home Screen",
              style: AppStyle.font14Width700,
            ),
            const Divider(),
            Text(
              "In this Screen I have implemented the give UI with network Image.",
              style: AppStyle.font14Width400,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "TV Screen",
              style: AppStyle.font14Width700,
            ),
            const Divider(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "In this Screen I have implemented API  with Riverpod. Please Pull down to refresh for API calling when back to online",
                style: AppStyle.font14Width400,
                maxLines: 5,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Download Screen",
              style: AppStyle.font14Width700,
            ),
            const Divider(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "I have created a database in SQFLite,When api call appear the data will store in Database.In this Screen I have call the data from database.Please Pull down to refresh if data not available in the case the API call in unsuccessful",
                style: AppStyle.font14Width400,
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
