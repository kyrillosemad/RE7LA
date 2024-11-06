class BookedTravelModel {
  int? travelId;
  String? travelFrom;
  String? travelTo;
  String? travelType;
  int? seatsCount;
  int? coachesCount;
  String? travelDate;
  int? travelPrice;
  int? travelComplete;
  List<Coaches>? coaches;
  List<Stations>? stations;

  BookedTravelModel(
      {this.travelId,
      this.travelFrom,
      this.travelTo,
      this.travelType,
      this.seatsCount,
      this.coachesCount,
      this.travelDate,
      this.travelPrice,
      this.travelComplete,
      this.coaches,
      this.stations});

  BookedTravelModel.fromJson(Map<String, dynamic> json) {
    travelId = json['travel_id'];
    travelFrom = json['travel_from'];
    travelTo = json['travel_to'];
    travelType = json['travel_type'];
    seatsCount = json['seats_count'];
    coachesCount = json['coaches_count'];
    travelDate = json['travel_date'];
    travelPrice = json['travel_price'];
    travelComplete = json['travel_complete'];
    if (json['coaches'] != null) {
      coaches = <Coaches>[];
      json['coaches'].forEach((v) {
        coaches!.add(Coaches.fromJson(v));
      });
    }
    if (json['stations'] != null) {
      stations = <Stations>[];
      json['stations'].forEach((v) {
        stations!.add(Stations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['travel_id'] = travelId;
    data['travel_from'] = travelFrom;
    data['travel_to'] = travelTo;
    data['travel_type'] = travelType;
    data['seats_count'] = seatsCount;
    data['coaches_count'] = coachesCount;
    data['travel_date'] = travelDate;
    data['travel_price'] = travelPrice;
    data['travel_complete'] = travelComplete;
    if (coaches != null) {
      data['coaches'] = coaches!.map((v) => v.toJson()).toList();
    }
    if (stations != null) {
      data['stations'] = stations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coaches {
  int? coachId;
  int? coachNumber;
  List<Seats>? seats;

  Coaches({this.coachId, this.coachNumber, this.seats});

  Coaches.fromJson(Map<String, dynamic> json) {
    coachId = json['coach_id'];
    coachNumber = json['coach_number'];
    if (json['seats'] != null) {
      seats = <Seats>[];
      json['seats'].forEach((v) {
        seats!.add(Seats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coach_id'] = coachId;
    data['coach_number'] = coachNumber;
    if (seats != null) {
      data['seats'] = seats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Seats {
  int? seatId;
  int? seatNumber;
  int? ownerId;
  int? travelId;
  int? seatStatus;
  int? reservationCode;
  int? cancelCode;

  Seats(
      {this.seatId,
      this.seatNumber,
      this.ownerId,
      this.travelId,
      this.seatStatus,
      this.reservationCode,
      this.cancelCode});

  Seats.fromJson(Map<String, dynamic> json) {
    seatId = json['seat_id'];
    seatNumber = json['seat_number'];
    ownerId = json['owner_id'];
    travelId = json['travel_id'];
    seatStatus = json['seat_status'];
    reservationCode = json['reservation_code'];
    cancelCode = json['cancel_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seat_id'] = seatId;
    data['seat_number'] = seatNumber;
    data['owner_id'] = ownerId;
    data['travel_id'] = travelId;
    data['seat_status'] = seatStatus;
    data['reservation_code'] = reservationCode;
    data['cancel_code'] = cancelCode;
    return data;
  }
}

class Stations {
  String? stationName;
  String? stationArrivalDate;

  Stations({this.stationName, this.stationArrivalDate});

  Stations.fromJson(Map<String, dynamic> json) {
    stationName = json['station_name'];
    stationArrivalDate = json['station_arrival_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['station_name'] = stationName;
    data['station_arrival_date'] = stationArrivalDate;
    return data;
  }
}
