import 'package:first_project/constant/constant_export.dart';
import 'package:first_project/screens/login/sign_in.dart';
import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';

import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/otp_base.dart';
import '../../widgets/text_button_base.dart';
import '../../widgets/text_field_base.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _showPassword = true;
  bool _showRePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(

            children: [

              const ImageLogo(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Tạo tài khoản',
                        style: TextStyleApp.txt_robo_24_black_w500),
                  ),
                  const TextFieldBase(
                    label: 'Họ tên',
                    hintText: 'Nhập tên của bạn',
                  ),
                  const TextFieldBase(
                    label: 'Số điện thoại',
                    hintText: 'Nhập số điện thoại',

                  ),
                  TextFieldBase(

                    obscureText: _showPassword,
                    label: 'Mật khẩu',
                    hintText: 'Mật khẩu chứa ít nhất 8 kí tự',
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
                  TextFieldBase(
                    obscureText: _showRePassword,
                    label: 'Nhập lại mật khẩu',
                    hintText: 'Mật khẩu chứa ít nhất 8 kí tự',
                    suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showRePassword = !_showRePassword;
                        });
                      },
                      child: Image.asset(_showRePassword
                          ? 'assets/icons/hidden.png'
                          : 'assets/icons/unhide.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButtonBase(
                      text: 'Đăng nhập',
                      onPressed: () {},
                    ),
                  ),
                  const BackTextButtonBase(),
                ],
              ),
             
            ]),
      ),
    );
  }
}
