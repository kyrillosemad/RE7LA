import 'package:bloc/bloc.dart';
import 'package:get/route_manager.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/model/travel_model.dart';
import 'package:re7la/view%20model/app_states.dart';

class TravelDetailsCubit extends Cubit<AppState> {
  TravelDetailsCubit() : super(Initial());
  List selectedSeat = [];
  List seatsIds = [];
  var data = Get.arguments['data'];
  int coachNumber = 0;
  List seats = [];
  selectSeat(widget, index) {
    if (widget.travelModel.coaches![coachNumber].seats![index].seatStatus ==
        0) {
      String seatId =
          "${widget.travelModel.coaches![coachNumber].seats![index].seatId}";
      if (!widget.controller.selectedSeat
          .any((seat) => seat['seatId'] == seatId)) {
        seatsIds.add(seatId);
        widget.controller.selectedSeat.add({
          'seatId': seatId,
          'seatNumber': index + 1,
          'coachId': coachNumber + 1,
        });
      } else {
        widget.controller.selectedSeat
            .removeWhere((seat) => seat['seatId'] == seatId);
        seatsIds.remove(seatId);
      }
    }
  }

  viewSeats(int coachNumber) async {
    emit(Loading());
    await Future.delayed(const Duration(milliseconds: 300));
    TravelModel travelModel = TravelModel.fromJson(data);
    seats = [];
    seats = travelModel.coaches![coachNumber].seats as List;
    emit(Success(seats));
  }

  goToBookingDetails() {
    TravelModel travelModel = TravelModel.fromJson(data);
    Get.toNamed(AppRoutes().bookingDetails, arguments: {
      "seatPrice": travelModel.travelPrice,
      "travelId": travelModel.travelId,
      "totalPrice": selectedSeat.length * travelModel.travelPrice!.toInt(),
      "seats": selectedSeat,
      "seatsIds": seatsIds,
      'travelFrom': travelModel.travelFrom,
      'travelTo': travelModel.travelTo,
      'travelDate': travelModel.travelDate
    });
  }
}
