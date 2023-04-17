import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          padding: const EdgeInsets.only(left: 10, bottom: 24),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            // borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.black, width: 1),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/image1.png'),
            ),
          ),
        ),
      ),
      
    );
  }
}


const double extraSmallAvatarSize = 20;
const double smallAvatarSize = 24;
const double mediumAvatarSize = 32;
const double largeAvatarSize = 44;
const double extraLargeAvatarSize = 80;
class AvatarWidget {
  static Widget base({
    Image? image,
    String? imagePath,
    double? size,
    String name = "",
    bool isBorder = false,
  }) {
    final finalSize = size ?? largeAvatarSize;
    return Container(
        height: finalSize,
        width: finalSize,
        padding: EdgeInsets.all(isBorder ? (finalSize ~/ 30).toDouble() : 0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: isBorder ? Border.all(color: BaseColor.blue300) : null),
        child: (image != null)
            ? CircleAvatar(
                radius: extraLargeAvatarSize,
                foregroundImage: image.image,
                backgroundColor: Colors.white,
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      height: finalSize,
                      width: finalSize,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: BaseColor.grey40),
                      child: Text(StringHelper.createNameKey(name),
                          style: BaseTextStyle.label()
                              .copyWith(fontSize: finalSize / 3))),
                  if (imagePath != null)
                    Container(
                      height: finalSize,
                      width: finalSize,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: BaseColor.grey40)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(finalSize),
                          child: Image.network(imagePath, fit: BoxFit.cover)),
                    ),
                ],
              ));
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