import 'package:flutter/material.dart';
import 'package:test_christmas/app/context_ext.dart';

class Texts extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign textAlign;
  final double? letterSpacing;
  final TextDecoration? textDecoration;
  final String? fontFamily;
  final shadows;
  final bool? softWrap;
  final FontStyle? fontStyle;
  final TextDirection? textDirection;

  final double? height;

  /// if set and not null then all of the default values will be ignored
  /// for this text widget that is color,fontSize etc...
  final TextStyle? style;

  const Texts(
    this.text, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.maxLines,
    this.overflow,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
    this.textDecoration,
    this.fontFamily,
    this.shadows,
    this.softWrap,
    this.fontStyle,
    this.style,
    this.textDirection,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textDirection: textDirection,
      style: style ?? context.titleLarge,
      strutStyle: StrutStyle(
        fontSize: fontSize ?? style?.fontSize,
        forceStrutHeight: true,
      ),
    );
  }
}
