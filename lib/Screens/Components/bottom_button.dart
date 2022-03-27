import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.color,
    required this.textColor,
    required this.iconColor,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final Function() onTap;
  final Color? color;
  final Color textColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        height: size.height * 0.05,
        width: size.width * 0.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              text,
              style: GoogleFonts.muli(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 20, color: kComponents
                ),
              ),),
          ],
        ),
      ),
    );
  }
}
