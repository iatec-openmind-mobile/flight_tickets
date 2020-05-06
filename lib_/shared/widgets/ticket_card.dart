import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';
import '../models/flight_ticket.dart';

class TicketCard extends StatelessWidget {
  final FlightTicket ticket;

  const TicketCard({Key key, this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 38,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 20,
              ),
              child: Table(
                children: <TableRow>[
                  TableRow(
                    children: [
                      Text(
                        ticket.company,
                        style: const TextStyle(
                          color: MyColors.lightGrey,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/images/${ticket.company.toLowerCase()}.svg",
                        color: MyColors.niceBlue,
                        width: 72 ,
                        //fit: BoxFit.
                      ),
                      Text(
                        "\$${ticket.price.truncate()}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: MyColors.backgroundGrey,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 22,
                bottom: 20,
              ),
              child: Table(
                //border: TableBorder.all(),
                columnWidths: {1: IntrinsicColumnWidth()},
                children: <TableRow>[
                  TableRow(
                    children: [
                      Text(
                        ticket.departure.name,
                        style: const TextStyle(
                          color: MyColors.mediumGrey,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        ticket.duration,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        ticket.arrival.name,
                        style: const TextStyle(
                          color: MyColors.mediumGrey,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        ticket.departure.time,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(),
                      Text(
                        ticket.arrival.time,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Details & baggage fees",
                  style: TextStyle(
                    color: MyColors.niceBlue,
                  ),
                ),
                const Icon(
                  Icons.more_horiz,
                  color: MyColors.mediumGrey,
                ),
              ],
            ),
          ],
        ),
      );
}
