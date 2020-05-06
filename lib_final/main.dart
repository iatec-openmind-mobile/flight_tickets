import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/colors.dart';
import 'shared/models/flight_ticket.dart';
import 'shared/repositories/tickets_repository.dart';
import 'shared/widgets/ticket_card.dart';
import 'shared/widgets/topbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      home: MyHomePage(title: 'Layout'),
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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  List<FlightTicket> tickets = [];

  @override
  void initState() {
    super.initState();
    _loadTickets();
    
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _refreshIndicatorKey.currentState?.show();
    });
  }

  Future<void> _loadTickets() => TicketsRepository().getTickets().then(
        (result) => setState(
          () {
            tickets = result;
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundGrey,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Topbar(results: tickets.length),
              Expanded(
                child: RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: _loadTickets,
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(
                      24.0,
                      MediaQuery.of(context).padding.top,
                      24.0,
                      15.0,
                    ),
                    itemBuilder: (_, index) =>
                        TicketCard(ticket: tickets[index]),
                    itemCount: tickets.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                  ),
                ),
              ),
            ],
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
