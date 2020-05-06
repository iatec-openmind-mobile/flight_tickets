import 'package:json_annotation/json_annotation.dart';

import 'place.dart';

part 'flight_ticket.g.dart';

@JsonSerializable(explicitToJson: true)
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

  static FlightTicket fromJson(Map<String, dynamic> json) => _$FlightTicketFromJson(json);
  Map<String, dynamic> toJson() => _$FlightTicketToJson(this);
}
