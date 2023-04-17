import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  AvatarWidget({
    super.key,
    this.size,
    this.shape,
    this.boxFit,
    this.name,
    this.image,
    this.isBorder,
    this.color,
  });

  double? size;
  BoxShape? shape;
  BoxFit? boxFit;
  String? name = '';
  String? image;
  String? src;
  bool? isBorder;
  Color? color;

  @override
  Widget build(BuildContext context) {
    if (image! != null) {
      return Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.circle,
          border: isBorder! ? Border.all(color: Colors.black) : null,
          image: DecorationImage(
            fit: boxFit ?? BoxFit.fill,
            image: AssetImage(image as String),
          ),
        ),
      );
    } else if (src! != null) {
      return Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.circle,
          border: isBorder! ? Border.all(color: Colors.black) : null,
          image: DecorationImage(
            fit: boxFit ?? BoxFit.fill,
            image: NetworkImage(src!),
          ),
        ),
      );
    } else {
      return Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          shape: shape ?? BoxShape.circle,
          border: isBorder! ? Border.all(color: Colors.black) : null,
        ),
        child: Center(
          child: Text(
            StringHelper.createNameKey(name!),
          ),
        ),
      );
    }
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
