import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:re7la/core/classes/status.dart';
import 'package:re7la/data/tickets/view_tickets_req.dart';
import 'package:re7la/view%20model/app_states.dart';

class TicketsCubit extends Cubit<AppState> {
  TicketsCubit() : super(Initial());
  var data = [];

showReservationCode()
{

}

  viewBookedTravels() async {
    emit(Loading());
    Either<Status, Map> response = await viewTicketsReq();
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
    print(data);
  }
}
