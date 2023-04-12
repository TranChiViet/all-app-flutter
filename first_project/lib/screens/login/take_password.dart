import 'package:first_project/constant/constant_export.dart';
import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';

import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/otp_base.dart';
import '../../widgets/text_button_base.dart';
import '../../widgets/text_field_base.dart';
import 'otp.dart';

class TakePasswordScreen extends StatelessWidget {
  const TakePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: ImageLogo(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Tạo tài khoản',
                    style: TextStyleApp.txt_robo_24_black_w500),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Vui lòng nhập',
                    style: TextStyleApp.txt_robo_16_black_w400,
                  ),
                  TextSpan(
                    text: ' Số điện thoại ',
                    style: TextStyleApp.txt_robo_16_black_w600,
                  ),
                  TextSpan(
                    text: 'của bạn',
                    style: TextStyleApp.txt_robo_16_black_w400,
                  ),
                ]),
              ),
              const TextFieldBase(
                label: 'Số điện thoại',
                hintText: 'Nhập số điện thoại',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButtonBase(
                  text: 'Gửi mã OTP',
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => OtpScreen()));
                  },
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
