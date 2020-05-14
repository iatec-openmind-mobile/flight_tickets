import 'package:json_annotation/json_annotation.dart';

import 'place.dart';

part 'flight_ticket.g.dart';

/// A model representing flight ticket
@JsonSerializable(explicitToJson: true)
class FlightTicket {
  /// The company behind this
  final String company;

  /// The price of this
  final double price;

  /// The departure place and time of this' trip
  final Place departure;

  /// The arrival place and time of this' trip
  final Place arrival;

  /// The duration of this'
  final String duration;

  const FlightTicket(
    this.company,
    this.price,
    this.departure,
    this.arrival,
    this.duration,
  );

  /// Parses a json into a FlightTicket
  static FlightTicket fromJson(Map<String, dynamic> json) => _$FlightTicketFromJson(json);

  /// Parses this to a json representation of this' data
  Map<String, dynamic> toJson() => _$FlightTicketToJson(this);
}
