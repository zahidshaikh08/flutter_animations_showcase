import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:test_christmas/app/assets.dart';
import 'package:test_christmas/app/context_ext.dart';
import 'package:test_christmas/app/dimensions.dart';
import 'package:test_christmas/app/palette.dart';
import 'package:test_christmas/app/strings.dart';
import 'package:test_christmas/widgets/animated_position.dart';

class TextBoxWidget extends StatefulWidget {
  const TextBoxWidget({super.key, required this.onAnimationFinishedForTextBox});

  final Function onAnimationFinishedForTextBox;

  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  bool isPutInYourShow = false;
  bool isDiscountCodeShow = false;
  bool youWillLoveShow = false;
  bool isLottieShowing = false;
  bool isYourChristmas = false;

  double height = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      height = 250;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1800),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(Assets.icTextBoxBg), fit: BoxFit.fill),
      ),
      alignment: Alignment.center,
      curve: Curves.fastEaseInToSlowEaseOut,
      height: height,
      onEnd: () {
        setState(() {
          isYourChristmas = true;
        });
      },
      child: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              if (isYourChristmas)
                YourChristmasGiftWidget(
                  onAnimationFinished: () {
                    isPutInYourShow = true;
                    setState(() {});
                  },
                )
              else
                Opacity(
                  opacity: 0.0,
                  child: YourChristmasGiftWidget(
                    onAnimationFinished: () {},
                  ),
                ),
              if (isPutInYourShow)
                PutInYourTextWidget(
                  onAnimationFinished: () {
                    isDiscountCodeShow = true;
                    setState(() {});
                  },
                )
              else
                Opacity(
                  opacity: 0.0,
                  child: PutInYourTextWidget(
                    onAnimationFinished: () {},
                  ),
                ),
              if (isDiscountCodeShow)
                DiscountTextWidget(
                  onAnimationFinished: () {
                    youWillLoveShow = true;
                    isLottieShowing = true;
                    setState(() {});
                  },
                )
              else
                Opacity(
                  opacity: 0.0,
                  child: DiscountTextWidget(
                    onAnimationFinished: () {},
                  ),
                ),
              h12,
              if (youWillLoveShow)
                SurpriseAnimatedOpacityTextWidget(
                  onAnimationFinished: () {
                    isLottieShowing = false;
                    widget.onAnimationFinishedForTextBox.call();
                    setState(() {});
                  },
                )
              else
                Opacity(
                  opacity: 0.0,
                  child: SurpriseAnimatedOpacityTextWidget(
                    onAnimationFinished: () {},
                  ),
                ),
            ],
          ),
          Row(
            children: [
              isLottieShowing
                  ? SizedBox(
                      height: 100,
                      width: 100,
                      child: Lottie.asset(Assets.lottieAnimation),
                    )
                  : const SizedBox(),
              const Spacer(),
              isLottieShowing
                  ? SizedBox(
                      height: 100,
                      width: 100,
                      child: Lottie.asset(Assets.lottieAnimation),
                    )
                  : const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}

class YourChristmasGiftWidget extends StatefulWidget {
  const YourChristmasGiftWidget({super.key, required this.onAnimationFinished});

  final Function onAnimationFinished;

  @override
  State<YourChristmasGiftWidget> createState() => _YourChristmasGiftWidgetState();
}

class _YourChristmasGiftWidgetState extends State<YourChristmasGiftWidget> {
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: AnimatedContainerWidget(
        onAnimationFinished: widget.onAnimationFinished,
        delayDuration: Duration.zero,
        duration: const Duration(seconds: 2),
        child: Text(
          Strings.yourChristmasGiftText,
          style: context.label18ItalicBoldMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class PutInYourTextWidget extends StatefulWidget {
  const PutInYourTextWidget({super.key, required this.onAnimationFinished});

  final Function onAnimationFinished;

  @override
  State<PutInYourTextWidget> createState() => _PutInYourTextWidgetState();
}

class _PutInYourTextWidgetState extends State<PutInYourTextWidget> {
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
      duration: const Duration(seconds: 2),
      child: Text(
        Strings.putInYourText,
        style: GoogleFonts.irishGrover(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Palette.colorPrimary,
        ),
        textAlign: TextAlign.center,
      ),
      onEnd: () {
        widget.onAnimationFinished.call();
      },
    );
  }
}

class DiscountTextWidget extends StatelessWidget {
  const DiscountTextWidget({super.key, required this.onAnimationFinished});

  final Function onAnimationFinished;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22,
      child: AnimatedContainerWidget(
        onAnimationFinished: onAnimationFinished,
        delayDuration: Duration.zero,
        duration: const Duration(milliseconds: 1000),
        end: 0,
        begin: 22,
        child: Text(
          Strings.discountCodeText,
          style: GoogleFonts.irishGrover(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Palette.colorPrimary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class SurpriseAnimatedOpacityTextWidget extends StatefulWidget {
  final Function onAnimationFinished;

  const SurpriseAnimatedOpacityTextWidget({
    super.key,
    required this.onAnimationFinished,
  });

  @override
  State<SurpriseAnimatedOpacityTextWidget> createState() => _SurpriseAnimatedOpacityTextWidgetState();
}

class _SurpriseAnimatedOpacityTextWidgetState extends State<SurpriseAnimatedOpacityTextWidget> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000)).then(
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
      duration: const Duration(seconds: 2),
      child: Text(
        Strings.youWillLoveAllTheSurprisesText,
        style: context.label18BoldMedium,
        textAlign: TextAlign.center,
      ),
      onEnd: () {
        widget.onAnimationFinished.call();
      },
    );
  }
}
