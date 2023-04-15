import 'dart:ui';

import '../../config/config_export.dart';
import '../../model/movie.dart';

Color getColor(TicketStates state) {
  switch (state) {
    case TicketStates.idle:
      {
        return DarkTheme.darkBackground;
      }
    case TicketStates.active:
      {
        return DarkTheme.blueMain;
      }
    case TicketStates.busy:
      {
        return DarkTheme.greyBackground;
      }
  }
}
