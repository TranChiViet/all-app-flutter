import 'package:flutter/material.dart';

import 'avatar_widget.dart';

class AvatarBrick {
  Widget Asset({
    double size = 60,
    BoxFit? boxFit,
    required String? image,
    List<BoxShadow>? boxShadow,
    bool isBorder = false,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    double? circular,
    bool isRim = false,
    bool isStatus = false,
  }) {
    return AvatarBase(
      size: size,
      boxFit: boxFit,
      image: image,
      boxShadow: boxShadow,
      isBorder: isBorder,
      backgroundBlendMode: backgroundBlendMode,
      circular: circular,
      gradient: gradient,
      isRim: isRim,
      isStatus: isStatus,
    );
  }

  Widget Network({
    double size = 60,
    BoxFit? boxFit,
    required String? src,
    List<BoxShadow>? boxShadow,
    bool isBorder = false,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    double? circular,
    bool isRim = false,
    bool isStatus = false,
  }) {
    return AvatarBase(
      size: size,
      boxFit: boxFit,
      src: src,
      boxShadow: boxShadow,
      isBorder: isBorder,
      backgroundBlendMode: backgroundBlendMode,
      circular: circular,
      gradient: gradient,
      isRim: isRim,
      isStatus: isStatus,
    );
  }

  Widget Text({
    double size = 60,
    required String? name,
    List<BoxShadow>? boxShadow,
    bool isBorder = false,
    Color? backgroundColor,
    Color? textColor,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    double? circular,
    bool isRim = false,
    bool isStatus = false,
  }) {
    return AvatarBase(
      size: size,
      name: name,
      boxShadow: boxShadow,
      isBorder: isBorder,
      backgroundColor: backgroundColor,
      textColor: textColor,
      backgroundBlendMode: backgroundBlendMode,
      circular: circular,
      gradient: gradient,
      isRim: isRim,
      isStatus: isStatus,
    );
  }
}
