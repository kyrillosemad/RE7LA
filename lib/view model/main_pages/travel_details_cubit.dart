import 'package:bloc/bloc.dart';
import 'package:re7la/view%20model/app_states.dart';

class TravelDetailsCubit extends Cubit<AppState> {
  TravelDetailsCubit() : super(Initial());
  List<bool> seatSelected = List.generate(49, (index) => false);
  List<bool> seatBooked = List.generate(49, (index) => index % 3 == 0);
}
