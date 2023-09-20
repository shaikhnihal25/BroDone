import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DividerWithTitle extends StatelessWidget {
  String? title;
  DividerWithTitle({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          height: 10,
        )),
        Text(
          title ?? "Divider",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Expanded(
            child: Divider(
          height: 10,
        ))
      ],
    ).pOnly(top: 20, bottom: 20);
  }
}
