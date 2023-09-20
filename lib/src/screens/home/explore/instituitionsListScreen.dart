import 'package:flutter/material.dart';

class InstituitionsListScreen extends StatefulWidget {
  const InstituitionsListScreen({super.key});

  @override
  State<InstituitionsListScreen> createState() =>
      _InstituitionsListScreenState();
}

class _InstituitionsListScreenState extends State<InstituitionsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instituitions List"),
      ),
    );
  }
}
