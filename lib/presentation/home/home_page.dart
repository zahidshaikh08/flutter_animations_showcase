import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_christmas/app/assets.dart';
import 'package:test_christmas/app/context_ext.dart';
import 'package:test_christmas/app/palette.dart';
import 'package:test_christmas/app/strings.dart';
import 'package:test_christmas/presentation/home/widgets/button_widget.dart';
import 'package:test_christmas/widgets/animated_position.dart';
import 'package:test_christmas/widgets/scale_animation.dart';
import 'package:test_christmas/widgets/text_widget.dart';

import 'widgets/text_box_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  double opacity = 0;

  UniqueKey _uniqueKey = UniqueKey();

  bool isGiftShowing = false;
  bool isHappyShowing = false;
  bool isStripesShowing = false;
  bool isGoButtonShowing = false;
  bool isTextBoxShowing = false;
  bool isJustTypeInShowing = false;
  bool isAllChristmasShowing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _uniqueKey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.icBackgroundBg), fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        child: Stack(
          children: [
            if (isStripesShowing)
              Positioned(
                left: 0,
                right: 0,
                child: ScaleAnimation(
                  child: Transform.scale(
                    scale: 1.2,
                    child: Image.asset(
                      Assets.icStripsBg,
                      width: context.width,
                    ),
                  ),
                  onAnimationFinished: () {
                    isHappyShowing = true;
                    setState(() {});
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: context.height * 0.07),
                  MerryChristmasTextWidget(
                    onAnimationFinished: () {
                      Future.delayed(const Duration(milliseconds: 2000), () {
                        isGiftShowing = true;
                        setState(() {});
                      });
                    },
                  ),
                  SizedBox(height: context.height * 0.02),
                  if (isHappyShowing)
                    AnimatedOpacityTextWidget(
                      onAnimationFinished: () {
                        isTextBoxShowing = true;
                        setState(() {});
                      },
                    ),
                  SizedBox(height: context.height * 0.50),
                  if (isJustTypeInShowing)
                    JustTypeTextWidget(
                      onAnimationFinished: () {
                        isAllChristmasShowing = true;
                        setState(() {});
                      },
                    ),
                  if (isAllChristmasShowing)
                    AllWishesTextWidget(
                      onAnimationFinished: () {
                        isGoButtonShowing = true;
                        setState(() {});
                      },
                    ),
                  SizedBox(height: context.height * 0.01),
                  if (isGoButtonShowing)
                    ButtonWidget(
                      buttonText: Strings.goText,
                      onTap: () async {
                        _uniqueKey = UniqueKey();
                        isGiftShowing = false;
                        isHappyShowing = false;
                        isStripesShowing = false;
                        isGoButtonShowing = false;
                        isTextBoxShowing = false;
                        isJustTypeInShowing = false;
                        isAllChristmasShowing = false;
                        setState(() {});
                      },
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: context.height * 0.15),
              child: Column(
                children: [
                  if (isGiftShowing)
                    GiftImageWidget(
                      onAnimationFinished: () {
                        isStripesShowing = true;
                        setState(() {});
                      },
                    ),
                  if (isTextBoxShowing)
                    TextBoxWidget(
                      onAnimationFinishedForTextBox: () {
                        isJustTypeInShowing = true;
                        setState(() {});
                      },
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MerryChristmasTextWidget extends StatelessWidget {
  final Function onAnimationFinished;

  const MerryChristmasTextWidget({super.key, required this.onAnimationFinished});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleAnimation(
        delayDuration: const Duration(seconds: 1),
        onAnimationFinished: onAnimationFinished,
        child: Column(
          children: [
            Texts(
              Strings.merryChristmasToText,
              style: GoogleFonts.rye(
                fontSize: context.width * 0.065,
                color: Palette.colorPrimary,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            NameTextWidget(
              onAnimationFinished: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class NameTextWidget extends StatelessWidget {
  final Function onAnimationFinished;

  const NameTextWidget({super.key, required this.onAnimationFinished});

  @override
  Widget build(BuildContext context) {
    return Texts(
      Strings.nameText,
      style: GoogleFonts.rosarivo(
        fontSize: context.width * 0.08,
        color: Palette.whiteColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class GiftImageWidget extends StatefulWidget {
  final Function onAnimationFinished;

  const GiftImageWidget({super.key, required this.onAnimationFinished});

  @override
  State<GiftImageWidget> createState() => _GiftImageWidgetState();
}

class _GiftImageWidgetState extends State<GiftImageWidget> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      onAnimationFinished: widget.onAnimationFinished,
      child: Center(
        child: Image.asset(
          Assets.giftGif,
          height: context.width * 0.5,
        ),
      ),
    );
  }
}

class JustTypeTextWidget extends StatelessWidget {
  const JustTypeTextWidget({super.key, required this.onAnimationFinished});

  final Function onAnimationFinished;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: AnimatedContainerWidget(
        delayDuration: const Duration(milliseconds: 1000),
        onAnimationFinished: onAnimationFinished,
        child: Texts(
          Strings.justTypeInText,
          style: GoogleFonts.ribeye(
            fontSize: 24,
            color: Palette.whiteColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class AllWishesTextWidget extends StatelessWidget {
  const AllWishesTextWidget({super.key, required this.onAnimationFinished});

  final Function onAnimationFinished;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: AnimatedContainerWidget(
        delayDuration: const Duration(milliseconds: 1000),
        onAnimationFinished: onAnimationFinished,
        child: Texts(
          Strings.allYourWishesText,
          style: GoogleFonts.ribeye(
            fontSize: 24,
            color: Palette.whiteColor,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class AnimatedOpacityTextWidget extends StatefulWidget {
  final Function onAnimationFinished;

  const AnimatedOpacityTextWidget({
    super.key,
    required this.onAnimationFinished,
  });

  @override
  State<AnimatedOpacityTextWidget> createState() => _AnimatedOpacityTextWidgetState();
}

class _AnimatedOpacityTextWidgetState extends State<AnimatedOpacityTextWidget> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500)).then(
      (value) {
        opacity = 1;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(seconds: 1),
      child: Image.asset(Assets.icIAmGHappyTextBg),
      onEnd: () {
        widget.onAnimationFinished.call();
      },
    );
  }
}

void showLog(String? message) {
  debugPrint(message, wrapWidth: 200);
}
