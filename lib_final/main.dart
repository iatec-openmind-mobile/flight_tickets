import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/colors.dart';
import 'shared/flight_ticket.dart';
import 'shared/ticket_card.dart';
import 'shared/topbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
          body1: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundGrey,
      body: Stack(
        children: <Widget>[
          ListView.separated(
            padding: EdgeInsets.fromLTRB(
              24.0,
              150.0 + MediaQuery.of(context).padding.top,
              24.0,
              15.0,
            ),
            itemBuilder: (_, index) => TicketCard(ticket: tickets[index]),
            itemCount: tickets.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Topbar(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      MyColors.backgroundGrey.withAlpha(0),
                      Colors.white,
                    ],
                  ),
                ),
                height: 188.0,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.tune),
        backgroundColor: MyColors.niceBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
