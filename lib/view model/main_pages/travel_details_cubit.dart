import 'package:bloc/bloc.dart';
import 'package:get/route_manager.dart';
import 'package:re7la/model/travel_model.dart';
import 'package:re7la/view%20model/app_states.dart';

class TravelDetailsCubit extends Cubit<AppState> {
  TravelDetailsCubit() : super(Initial());
  List selectedSeat = [];
  var data = Get.arguments['data'];
  int coachNumber = 0;
  selectSeat(widget, index) {
    if (widget.travelModel.coaches![coachNumber].seats![index].seatStatus ==
        0) {
      String seatId =
          "${widget.travelModel.coaches![coachNumber].seats![index].seatId}";
      if (!widget.controller.selectedSeat.contains(seatId)) {
        widget.controller.selectedSeat.add(seatId);
      } else {
        widget.controller.selectedSeat.remove(seatId);
      }
    }
  }

  printData() {
    TravelModel travelModel = TravelModel.fromJson(data);
    print(
        "the travel Total Price is ${selectedSeat.length * travelModel.travelPrice!.toInt()}");
    print("the travel Seats is $selectedSeat");
    print("the travel all info is ${travelModel.travelId}");
  }
}

//ان لما اغير العربة حالة الكراسي لا تتغير بتلقائية
