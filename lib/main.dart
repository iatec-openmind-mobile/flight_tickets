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
      title: 'Flight Tickets',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
          body1: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Here, the GlobalKey will be used to access our RefreshIndicator
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  /// The list of tickets available
  List<FlightTicket> tickets = [];

  @override
  void initState() {
    super.initState();

    // Here we force our RefreshIndicator to show its loading circle
    // and load our data (as specified on it's [onRefresh] property).
    // It is necessary to schedule the [show] method to the next frame,
    // as in the first one the RefreshIndicator has not been built yet.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _refreshIndicatorKey.currentState?.show();
    });
  }

  // Loads the ticket data from the repository and updates our state
  Future<void> _loadTickets() => TicketsRepository().getTickets().then(
        (result) => setState(
          () => tickets = result,
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
