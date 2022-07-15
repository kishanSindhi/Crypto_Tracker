import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Text textWidget;
  const ReusableCard({Key? key, required this.textWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Card(
        elevation: 5.0,
        color: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
          child: textWidget,
        ),
      ),
    );
  }
}
