import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:re7la/core/classes/status.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/data/travels/view_all_travels_req.dart';
import 'package:re7la/view model/app_states.dart';

class ExploreCubit extends Cubit<AppState> {
  ExploreCubit() : super(Initial());
  String? selectedFrom;
  String? selectedTo;
  var data = [];
  DateTime? selectedDate;
  final List<String> governorates = [
    'All',
    'Cairo',
    'Alexandria',
    'Giza',
    'Aswan',
    'Asyut',
    'Beheira',
    'Beni_Suef',
    'Dakahlia',
    'Damietta',
    'Faiyum',
    'Gharbia',
    'Ismailia',
    'Kafr_El_Sheikh',
    'Luxor',
    'Marsa_Matruh',
    'Minya',
    'Monufia',
    'New_Valley',
    'North_Sinai',
    'Port_Said',
    'Qalyubia',
    'Qena',
    'Red_Sea',
    'Sharqia',
    'Sohag',
    'South_Sinai',
    'Suez'
  ];
  void updateSelectedDate(DateTime? date) {
    selectedDate = date;
    viewAllTravels();
  }

  goToTravelDetails(data) {
    Get.toNamed(AppRoutes().busBooking, arguments: {
      "data": data,
    });
  }

  viewAllTravels() async {
    emit(Loading());
    Either<Status, Map> response = await viewAllTravelsReq();
    response.fold((l) {
      if (l == Status.internetFailure) {
        emit(InternetError());
      } else {
        emit(ServerError());
      }
    }, (r) {
      if (r['status'] == "success") {
        if ((selectedFrom == null ||
                selectedFrom!.isEmpty ||
                selectedFrom == 'All') &&
            (selectedTo == null ||
                selectedTo!.isEmpty ||
                selectedTo == 'All')) {
          data = r['data'];
        } else if (selectedFrom == null ||
            selectedFrom!.isEmpty ||
            selectedFrom == 'All') {
          data = r['data']
              .where((travel) => travel['travel_to']
                  .toString()
                  .toLowerCase()
                  .startsWith(selectedTo!.toLowerCase()))
              .toList();
        } else if (selectedTo == null ||
            selectedTo!.isEmpty ||
            selectedTo == 'All') {
          data = r['data']
              .where((travel) => travel['travel_from']
                  .toString()
                  .toLowerCase()
                  .startsWith(selectedFrom!.toLowerCase()))
              .toList();
        } else {
          data = r['data']
              .where((travel) =>
                  travel['travel_from']
                      .toString()
                      .toLowerCase()
                      .startsWith(selectedFrom!.toLowerCase()) &&
                  travel['travel_to']
                      .toString()
                      .toLowerCase()
                      .startsWith(selectedTo!.toLowerCase()))
              .toList();
        }
        if (selectedDate != null) {
          data = r['data'].where((travel) {
            DateTime travelDate = DateTime.parse(travel['travel_date']);
            return travelDate.year == selectedDate!.year &&
                travelDate.month == selectedDate!.month &&
                travelDate.day == selectedDate!.day;
          }).toList();
        } else {
          data = data;
        }
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
