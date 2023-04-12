import 'package:first_project/constant/constant_export.dart';
import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';

import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/text_field_base.dart';

class PutPasswordScreen extends StatefulWidget {
  const PutPasswordScreen({super.key});

  @override
  State<PutPasswordScreen> createState() => _PutPasswordScreenState();
}

class _PutPasswordScreenState extends State<PutPasswordScreen> {
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

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: ImageLogo(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Quên mật khẩu',
                        style: TextStyleApp.txt_robo_24_black_w500),
                  ),
                 Text('Vui lòng nhập mật khẩu mới của bạn.',
                        style: TextStyleApp.txt_robo_16_black_w400),
                  TextFieldBase(
                    // controller: _passController,
                    obscureText: _showPassword,
                    label: 'Mật khẩu mới',
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
                    label: 'Xác nhận mật khẩu',
                    hintText: 'Nhập lại mật khẩu mới',
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
                      text: 'Lưu',
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
