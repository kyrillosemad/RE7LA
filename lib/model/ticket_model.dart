class TicketModel {
  int? ticketId;
  int? ticketOwnerId;
  int? ticketReservationCode;
  int? ticketTravelId;
  String? ticketTravelFrom;
  String? ticketTravelTo;
  String? ticketTravelDate;
  int? travelId;
  int? travelPrice;
  List<Seats>? seats;

  TicketModel(
      {this.ticketId,
      this.ticketOwnerId,
      this.ticketReservationCode,
      this.ticketTravelId,
      this.ticketTravelFrom,
      this.ticketTravelTo,
      this.ticketTravelDate,
      this.travelId,
      this.travelPrice,
      this.seats});

  TicketModel.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticket_id'];
    ticketOwnerId = json['ticket_owner_id'];
    ticketReservationCode = json['ticket_reservation_code'];
    ticketTravelId = json['ticket_travel_id'];
    ticketTravelFrom = json['ticket_travel_from'];
    ticketTravelTo = json['ticket_travel_to'];
    ticketTravelDate = json['ticket_travel_date'];
    travelId = json['travel_id'];
    travelPrice = json['travel_price'];
    if (json['seats'] != null) {
      seats = <Seats>[];
      json['seats'].forEach((v) {
        seats!.add(Seats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticket_id'] = ticketId;
    data['ticket_owner_id'] = ticketOwnerId;
    data['ticket_reservation_code'] = ticketReservationCode;
    data['ticket_travel_id'] = ticketTravelId;
    data['ticket_travel_from'] = ticketTravelFrom;
    data['ticket_travel_to'] = ticketTravelTo;
    data['ticket_travel_date'] = ticketTravelDate;
    data['travel_id'] = travelId;
    data['travel_price'] = travelPrice;
    if (seats != null) {
      data['seats'] = seats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Seats {
  int? seatNumber;
  int? seatCoachNumber;

  Seats({this.seatNumber, this.seatCoachNumber});

  Seats.fromJson(Map<String, dynamic> json) {
    seatNumber = json['seat_number'];
    seatCoachNumber = json['seat_coach_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seat_number'] = seatNumber;
    data['seat_coach_number'] = seatCoachNumber;
    return data;
  }
}
