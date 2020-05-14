import 'package:json_annotation/json_annotation.dart';

part 'place.g.dart';

/// A model representing the place and time of the trip
@JsonSerializable()
class Place {
  /// This' name
  final String name;

  /// This' arrival/departure time
  final String time;

  const Place(
    this.name,
    this.time,
  );

  /// Parses a json into a FlightTicket
  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  /// Parses this to a json representation of this' data
  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
