import 'package:dio/dio.dart';

import '../models/flight_ticket.dart';

class TicketsRepository {
  final Dio http = Dio(BaseOptions(baseUrl: "http://localhost:3000"));

  Future<List<FlightTicket>> getTickets() =>
      Future.delayed(const Duration(seconds: 5))
          .then((_) => http.get("/tickets"))
          .then((response) => response.data as List)
          .then((response) => response.cast<Map<String, dynamic>>())
          .then((response) => response.map(FlightTicket.fromJson).toList());
}
