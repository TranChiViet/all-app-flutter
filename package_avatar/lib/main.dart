import 'package:flutter/material.dart';
import 'package:package_avatar/avatar_package.dart';
import 'package:package_avatar/avatar_widget.dart';

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
  bool isBorder = true;
  String src =
      'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: 700,
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AvatarBrick().Asset(
                image: 'assets/images/image1.png',
                size: 60,
                boxFit: BoxFit.cover,
                isRim: true,
              ),
              box(),
              AvatarBrick().Asset(
                  image: 'assets/images/image1.png',
                  size: 60,
                  boxFit: BoxFit.cover,
                  isStatus: true,
                  ),
              box(),
              AvatarBrick().Asset(
                  image: 'assets/images/image1.png',
                  size: 60,
                  boxFit: BoxFit.cover,
                  isBorder: true,
                  circular: 14),
              box(),
              AvatarBrick().Network(
                src: src,
                size: 60,
                boxFit: BoxFit.cover,
                isRim: true,
              ),
              box(),
              AvatarBrick().Network(
                src: src,
                size: 60,
                boxFit: BoxFit.cover,
              ),
              box(),
              AvatarBrick().Network(
                  src: src,
                  size: 60,
                  boxFit: BoxFit.cover,
                  isBorder: true,
                  circular: 14),
              box(),

              AvatarBrick().Text(
                name: 'Chi Viet',
                size: 60,
                isRim: true,
              ),
              box(),
              AvatarBrick().Text(
                name: 'Chi Viet',
                size: 60,
              ),
              box(),
              AvatarBrick().Text(
                name: 'Chi Viet',
                size: 60,

                isBorder: true,
                // circular: 14
              ),
              box(),

              // AvatarBase(
              //   image: 'assets/images/image1.png',
              //   size: 60,
              //   boxFit: BoxFit.cover,
              //   isRim: true,
              // ),
              // AvatarBase(
              //   image: 'assets/images/image1.png',
              //   size: 90,
              //   boxFit: BoxFit.cover,
              // ),
              // AvatarBase(
              //   image: 'assets/images/image1.png',
              //   size: 60,
              //   boxFit: BoxFit.cover,
              //   isBorder: true,
              // ),
              // AvatarBase(
              //   image: 'assets/images/image1.png',
              //   size: 60,
              //   boxFit: BoxFit.cover,
              //   isBorder: true,
              //   circular: 14,
              // ),
              // AvatarBase(
              //   size: 60,
              //   name: 'Chi Viet',
              //   backgroundColor: Colors.white,
              //   isRim: true,
              // ),
              // AvatarBase(
              //   size: 60,
              //   name: 'Chi Viet',
              //   backgroundColor: Colors.white,
              // ),

              // AvatarBase(
              //   size: 60,
              //   name: 'Chi Viet',
              //   backgroundColor: Colors.white,
              //   isBorder: true,
              // ),
              // AvatarBase(
              //   size: 60,
              //   name: 'Chi Viet',
              //   backgroundColor: Colors.white,
              //   isBorder: true,
              //   circular: 14,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox box() => SizedBox(
        height: 10,
      );
}
