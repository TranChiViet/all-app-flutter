import 'package:first_project/constant/constant_export.dart';
import 'package:first_project/screens/login/sign_up.dart';
import 'package:first_project/screens/login/take_password.dart';
import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';

import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/otp_base.dart';
import '../../widgets/text_button_base.dart';
import '../../widgets/text_field_base.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _showPassword = true;
  bool _correctPhone = true;
  bool _correctPassword = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: ImageLogo(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text('Đăng nhập',
                          style: TextStyleApp.txt_robo_24_black_w500),
                    ),
                    TextFieldBase(
                      label: 'Số điện thoại',
                      hintText: 'Nhập số điện thoại',
                      correct: _correctPhone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            _correctPhone = false;
                          });
                        } else {
                          setState(() {
                            _correctPhone = true;
                          });
                        }
                      },
                    ),
                    !_correctPhone
                        ? Text(
                            'Nhập lại số điện thoại',
                            style: TextStyleApp.txt_robo_16_red_w400,
                          )
                        : const Text(''),
                    TextFieldBase(
                      obscureText: _showPassword,
                      label: 'Mật khẩu',
                      hintText: 'Mật khẩu chứa ít nhất 8 kí tự',
                      correct: _correctPassword,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          setState(() {
                            _correctPassword = false;
                          });
                        } else {
                          setState(() {
                            _correctPassword = true;
                          });
                        }
                      },
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        child: Image.asset(_showPassword
                            ? 'assets/icons/hidden.png'
                            : 'assets/icons/unhide.png'),
                      ),
                    ),
                    !_correctPassword
                        ? Text(
                            'Nhập lại mật khẩu',
                            style: TextStyleApp.txt_robo_16_red_w400,
                          )
                        : const Text(''),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButtonBase(
                          text: 'Quên mật khẩu?',
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TakePasswordScreen()));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButtonBase(
                            text: 'Đăng nhập',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Bạn chưa có tài khoản?',
                      style: TextStyleApp.txt_robo_16_grey_w500,
                    ),
                    TextButtonBase(
                      text: 'Tạo tài khoản ngay',
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
