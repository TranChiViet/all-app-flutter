import 'package:flutter/material.dart';

class AvatarBase extends StatelessWidget {
  AvatarBase({
    Key? key,
    required this.size,
    this.boxFit,
    this.name = '',
    this.image,
    this.src,
    this.isBorder = false,
    this.backgroundColor,
    this.textColor,
    this.boxShadow,
    this.backgroundBlendMode,
    this.gradient,
    this.circular,
    this.isRim = false,
    this.isStatus = false,
  }) : super(key: key);

  double size;
  BoxFit? boxFit;
  String? name;
  String? image;
  String? src;
  List<BoxShadow>? boxShadow;
  bool isBorder;
  Color? backgroundColor;
  Color? textColor;
  Gradient? gradient;
  BlendMode? backgroundBlendMode;
  double? circular;
  bool isRim;
  bool isStatus;

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return _buildImage(AssetImage(image!));
    } else if (src != null) {
      return _buildImage(NetworkImage(src!));
    } else {
      return _buildText();
    }
  }

  Container _buildText() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: isRim ? BoxShape.circle : BoxShape.rectangle,
        border: isRim ? Border.all(color: Colors.red) : null,
      ),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          shape: isBorder ? BoxShape.rectangle : BoxShape.circle,
          border: isBorder ? Border.all(color: Colors.black) : null,
          borderRadius: isBorder ? BorderRadius.circular(circular ?? 0) : null,
          boxShadow: boxShadow,
          backgroundBlendMode: backgroundBlendMode,
          gradient: gradient,
        ),
        child: Center(
          child: Text(
            StringHelper.createNameKey(name!),
            style: TextStyle(color: textColor ?? Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(ImageProvider<Object> image) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
      Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: isRim ? BoxShape.circle : BoxShape.rectangle,
          border: isRim ? Border.all(color: Colors.red) : null,
        ),
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            shape: isBorder ? BoxShape.rectangle : BoxShape.circle,
            border: isBorder ? Border.all(color: Colors.black) : null,
            borderRadius:
                isBorder ? BorderRadius.circular(circular ?? 0) : null,
            boxShadow: boxShadow,
            backgroundBlendMode: backgroundBlendMode,
            gradient: gradient,
            image: DecorationImage(
              fit: boxFit ?? BoxFit.fill,
              image: image,
            ),
          ),
          child: Center(
            child: Text(
              StringHelper.createNameKey(name!),
              style: TextStyle(
                color: textColor ?? Colors.black,
              ),
            ),
          ),
        ),
      ),
      isStatus ? Container(
        padding: EdgeInsets.all(2),
        decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        child: Container(
          height: size/3,
          width: size/3,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
      ): Container(),
    ]);
  }
}

class StringHelper {
  static String createNameKey(String name) {
    if (name.isEmpty) return "";
    String result = name[0];
    for (int i = 0; i < name.length - 1; i++) {
      if (name[i] == " " && name[i + 1] != " ") result += name[i + 1];
    }
    if (result.length > 2) result = result.substring(0, 2);
    return result.toUpperCase();
  }
}
