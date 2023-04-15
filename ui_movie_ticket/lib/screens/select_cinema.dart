import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../config/config_export.dart';
import '../constants/constants_export.dart';
import '../model/movie.dart';
import '../widgets/common/export.dart';
import '../widgets/select_cinema/export.dart';
import 'select_seat.dart';

class SelectCinemaScreen extends StatelessWidget {
  const SelectCinemaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(title: 'Ralph Breaks the\nInternet',),
            const SelectLocation(),
            Topic(title: 'Choose Date'),
            const ChooseDate(),
            Topic(title: 'Central Park CGV'),
            ChooseTime(
              timeStates: timeStates_1,
            ),
            Topic(title: 'FX Sudirman XXI'),
            ChooseTime(
              timeStates: timeStates_2,
            ),
            Topic(title: 'Kelepa Gading IMAX'),
            ChooseTime(
              timeStates: timeStates_3,
            ),
            NextButton(onPressed: (){
               Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SelectSeatScreen()));
            },),
          ],
        ),
      )),
    );
  }
}

