import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const AnswerButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(40),
          backgroundColor: const Color.fromARGB(255, 19, 2, 80),
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
