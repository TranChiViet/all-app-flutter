import 'package:flutter/material.dart';
import 'package:ui_movie_ticket/config/config_export.dart';
import 'package:ui_movie_ticket/constants/constants_export.dart';
import 'package:ui_movie_ticket/model/movie.dart';
import '../widgets/common/export.dart';
import 'check_out.dart';

class SelectSeatScreen extends StatelessWidget {
  const SelectSeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
            height: size.height,
            child: SingleChildScrollView(
              child: Column(
                    children: [
              const Header(title: 'Ralp Breaks The Internet'),
              Container(
                margin: const EdgeInsets.only(top: 4, left: 24),
                child: const Text(
                  'FX Sudirman XXI',
                  style: TxtStyle.heading3Light,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatusSeat(
                        color: DarkTheme.darkBackground, title: 'Available'),
                    _buildStatusSeat(
                        color: DarkTheme.greyBackground, title: 'Booked'),
                    _buildStatusSeat(color: DarkTheme.blueMain, title: 'Your Seat'),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: seatRow
                        .map((seat) => Builder(builder: (context) {
                              return Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: seatNumber.map((number) {
                                  return SeatButton(
                                    child: Text(
                                      seat + number,
                                      style: TxtStyle.heading3Medium,
                                    ),
                                  );
                                }).toList(),
                              );
                            }))
                        .toList(),
                  ),
                ),
              
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Screen',
                  style: TxtStyle.heading4,
                ),
              ),
              Image.asset(AssetPath.screenx2),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Total Price',
                          style: TxtStyle.heading4
                        ),
                        Text(
                          '150.000 VND',
                          style: TxtStyle.heading3Medium,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CheckOutScreen()));
                      },
                      child: Container(
                        height: size.height / 16,
                        width: size.width / 3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: DarkTheme.blueMain,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Text(
                          'Book Ticket',
                          style: TxtStyle.heading3Medium,
                        ),
                      ),
                    )
                  ],
                ),
              )
                    ],
                  ),
            ),
          )),
    );
  }

  Row _buildStatusSeat({required Color color, required String title}) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(4)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: TxtStyle.heading4,
          ),
        ),
      ],
    );
  }
}

class SeatButton extends StatefulWidget {
  const SeatButton({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  State<SeatButton> createState() => _SeatButtonState();
}

class _SeatButtonState extends State<SeatButton> {
  TicketStates _ticketStates = TicketStates.idle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( 8.0),
      child: SizedBox(
        height: 48,
        width: 48,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _ticketStates = _ticketStates == TicketStates.idle
                  ? TicketStates.active
                  : TicketStates.idle;
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: _ticketStates == TicketStates.idle
                    ? DarkTheme.greyBackground
                    : DarkTheme.blueMain,
                borderRadius: BorderRadius.circular(14)),
            child: widget.child,
          ),
        )
      ),
    );
  }
}
