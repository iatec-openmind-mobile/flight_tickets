class FlightTicket {
  final String company;
  final double price;
  final Place departure;
  final Place arrival;
  final String duration;

  const FlightTicket(
    this.company,
    this.price,
    this.departure,
    this.arrival,
    this.duration,
  );
}

class Place {
  final String name;
  final String time;

  const Place(this.name, this.time);
}

const List<FlightTicket> tickets = <FlightTicket>[
  FlightTicket(
    "Aeroflot",
    394,
    Place("LON", "6:30"),
    Place("MOW", "1:45"),
    "5h 15m (1 stop)",
  ),
  FlightTicket(
    "LOT",
    594,
    Place("LON", "8:00"),
    Place("MOW", "7:45"),
    "9h 45m (1 stop)",
  ),
  FlightTicket(
    "Lufthansa",
    456,
    Place("LON", "7:25"),
    Place("MOW", "3:10"),
    "5h 45m (1 stop)",
  ),
  FlightTicket(
    "Gol",
    211,
    Place("LON", "11:30"),
    Place("MOW", "16:45"),
    "4h 15m (1 stop)",
  ),
];
