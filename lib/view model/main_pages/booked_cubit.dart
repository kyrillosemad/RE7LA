import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:re7la/core/classes/status.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/data/travels/view_booked_travel.dart';
import 'package:re7la/view%20model/app_states.dart';

class BookedCubit extends Cubit<AppState> {
  BookedCubit() : super(Initial());
  var data = [];

  goToTravelDetails(data) {
    Get.toNamed(AppRoutes().busBooking, arguments: {
      "data": data,
    });
  }

  viewBookedTravels() async {
    emit(Loading());
    Either<Status, Map> response = await viewBookedTravelReq();
    response.fold((l) {
      if (l == Status.internetFailure) {
        emit(InternetError());
      } else {
        emit(ServerError());
      }
    }, (r) {
      if (r['status'] == "success") {
        data = r['data'];
        if (data.isEmpty) {
          emit(Empty());
        } else {
          emit(Success(data));
        }
      } else {
        emit(Empty());
      }
    });
  }
}
