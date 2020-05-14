import 'package:dio/dio.dart';

import '../models/flight_ticket.dart';

/// Repository to retrieve tickets data
class TicketsRepository {
  /// The server base URL
  static const baseUrl = "http://localhost:3000";

  /// The base http (Dio) client
  final Dio http = Dio(
    BaseOptions(baseUrl: baseUrl),
  );

  /// Retrives all the tickets from server
  Future<List<FlightTicket>> getTickets() =>
      Future<void>.delayed(const Duration(seconds: 5))
          .then((_) => http.get<List<Object>>("/tickets"))
          .then((response) => response.data.cast<Map<String, dynamic>>())
          .then((response) => response.map(FlightTicket.fromJson).toList());
}
