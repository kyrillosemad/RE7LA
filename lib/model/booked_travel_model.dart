class BookedTravelMode {
  int? travelId;
  String? travelFrom;
  String? travelTo;
  String? travelDate;
  int? travelPrice;
  int? travelComplete;
  List<Seats>? seats;

  BookedTravelMode(
      {this.travelId,
      this.travelFrom,
      this.travelTo,
      this.travelDate,
      this.travelPrice,
      this.travelComplete,
      this.seats});

  BookedTravelMode.fromJson(Map<String, dynamic> json) {
    travelId = json['travel_id'];
    travelFrom = json['travel_from'];
    travelTo = json['travel_to'];
    travelDate = json['travel_date'];
    travelPrice = json['travel_price'];
    travelComplete = json['travel_complete'];
    if (json['seats'] != null) {
      seats = <Seats>[];
      json['seats'].forEach((v) {
        seats!.add(Seats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['travel_id'] = travelId;
    data['travel_from'] = travelFrom;
    data['travel_to'] = travelTo;
    data['travel_date'] = travelDate;
    data['travel_price'] = travelPrice;
    data['travel_complete'] = travelComplete;
    if (seats != null) {
      data['seats'] = seats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Seats {
  int? seatId;
  int? seatNumber;
  int? travelId;
  int? seatStatus;
  int? reservationCode;
  int? cancelCode;

  Seats(
      {this.seatId,
      this.seatNumber,
      this.travelId,
      this.seatStatus,
      this.reservationCode,
      this.cancelCode});

  Seats.fromJson(Map<String, dynamic> json) {
    seatId = json['seat_id'];
    seatNumber = json['seat_number'];
    travelId = json['travel_id'];
    seatStatus = json['seat_status'];
    reservationCode = json['reservation_code'];
    cancelCode = json['cancel_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seat_id'] = seatId;
    data['seat_number'] = seatNumber;
    data['travel_id'] = travelId;
    data['seat_status'] = seatStatus;
    data['reservation_code'] = reservationCode;
    data['cancel_code'] = cancelCode;
    return data;
  }
}
