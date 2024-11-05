class TicketModel {
  int? ticketId;
  int? ticketOwnerId;
  int? ticketReservationCode;
  int? ticketTravelId;
  int? travelId;
  String? travelFrom;
  String? travelTo;
  int? travelPrice;
  String? travelDate;
  List<Seats>? seats;

  TicketModel(
      {this.ticketId,
      this.ticketOwnerId,
      this.ticketReservationCode,
      this.ticketTravelId,
      this.travelId,
      this.travelFrom,
      this.travelTo,
      this.travelPrice,
      this.travelDate,
      this.seats});

  TicketModel.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticket_id'];
    ticketOwnerId = json['ticket_owner_id'];
    ticketReservationCode = json['ticket_reservation_code'];
    ticketTravelId = json['ticket_travel_id'];
    travelId = json['travel_id'];
    travelFrom = json['travel_from'];
    travelTo = json['travel_to'];
    travelPrice = json['travel_price'];
    travelDate = json['travel_date'];
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
    data['travel_id'] = travelId;
    data['travel_from'] = travelFrom;
    data['travel_to'] = travelTo;
    data['travel_price'] = travelPrice;
    data['travel_date'] = travelDate;
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
