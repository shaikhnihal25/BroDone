import 'package:flutter/material.dart';

class WebinarsListScreen extends StatefulWidget {
  const WebinarsListScreen({super.key});

  @override
  State<WebinarsListScreen> createState() => _WebinarsListScreenState();
}

class _WebinarsListScreenState extends State<WebinarsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Webinars List"),
      ),
    );
  }
}
