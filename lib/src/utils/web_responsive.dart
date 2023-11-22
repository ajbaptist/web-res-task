import 'package:flutter/material.dart';

class WebResponsive extends StatefulWidget {
  const WebResponsive(
      {super.key, required this.child, required this.sideChild});

  final Widget sideChild;
  final Widget child;

  @override
  State<WebResponsive> createState() => _WebResponsiveState();
}

class _WebResponsiveState extends State<WebResponsive> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: (widget.sideChild), // Replace with your animation asset
        ),
        SizedBox(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(child: widget.child),
        ),
      ],
    );
  }
}
