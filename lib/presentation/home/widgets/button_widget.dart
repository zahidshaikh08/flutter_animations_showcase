import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_christmas/app/assets.dart';
import 'package:test_christmas/app/context_ext.dart';
import 'package:test_christmas/app/palette.dart';
import 'package:test_christmas/widgets/scale_animation.dart';
import 'package:test_christmas/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.buttonText,
    this.buttonStyle,
    required this.onTap,
  });

  final String buttonText;
  final TextStyle? buttonStyle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      onAnimationFinished: () {},
      delayDuration: const Duration(seconds: 1),
      begin: 0,
      child: Container(
        height: context.height * 0.15,
        decoration: BoxDecoration(
          // color: Colors.red,
          image: DecorationImage(
            image: AssetImage(Assets.icButtonBg),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.only(top: context.height * 0.037, left: context.width * 0.07),
        alignment: Alignment.topCenter,
        child: InkWell(
          onTap: onTap,
          child: Texts(
            buttonText,
            style: buttonStyle ??
                GoogleFonts.rye(
                  fontSize: context.height * 0.024,
                  fontWeight: FontWeight.w400,
                  color: Palette.blackColor,
                ),
          ),
        ),
      ),
    );
  }
}
