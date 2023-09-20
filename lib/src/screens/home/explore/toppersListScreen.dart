import 'package:flutter/material.dart';

class ToppersListScreen extends StatefulWidget {
  const ToppersListScreen({super.key});

  @override
  State<ToppersListScreen> createState() => _ToppersListScreenState();
}

class _ToppersListScreenState extends State<ToppersListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toppers List"),
      ),
    );
  }
}
