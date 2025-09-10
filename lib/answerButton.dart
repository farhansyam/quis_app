import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class answetButton extends StatelessWidget {
  const answetButton({
    super.key,
    required this.answetText,
    required this.onTap,
  });

  final String answetText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 0, 59, 111),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
      ),
      child: Text(answetText),
    );
  }
}
