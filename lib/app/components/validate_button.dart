import 'package:flutter/material.dart';

class ValidateButton extends StatelessWidget {
  final Function onTap;
  final String text;

  const ValidateButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: OutlinedButton(
        child: Text(
          "${text.toString()}",
          style: TextStyle(color: Colors.red),
        ),
        onPressed: () {
          onTap();
        },
      ),
    );
  }
}
