import 'package:flutter/material.dart';
import 'package:frontend/widgets/common_text.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const RoundedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 14)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        ),
        child: CommonText.medium(text),
      ),
    );
  }
}
