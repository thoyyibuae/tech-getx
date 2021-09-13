import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final Function onTap;
  final String text;

  const CartButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RaisedButton(
          child: Text(text),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            onTap();
          }),
    );
  }
}
