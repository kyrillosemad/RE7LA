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
        data = r['data'];

        if ((selectedFrom == null || selectedFrom == 'All') &&
            (selectedTo == null || selectedTo == 'All') &&
            selectedDate == null) {
          emit(EmptySearch());
          return;
        }

        if (selectedFrom != null &&
            selectedFrom!.isNotEmpty &&
            selectedFrom != 'All') {
          data = data.where((travel) {
            bool fromMatches = travel['travel_from']
                .toString()
                .toLowerCase()
                .startsWith(selectedFrom!.toLowerCase());
            bool inStations = travel['stations']?.any((station) =>
                    station['station_name']
                        .toString()
                        .toLowerCase()
                        .startsWith(selectedFrom!.toLowerCase())) ??
                false;

            if (inStations) {
              var station = travel['stations']?.firstWhere((station) =>
                  station['station_name']
                      .toString()
                      .toLowerCase()
                      .startsWith(selectedFrom!.toLowerCase()));
              if (station != null) {
                DateTime stationArrivalDate =
                    DateTime.parse(station['station_arrival_date']);
                travel['travel_from'] = selectedFrom;
                travel['travel_date'] = stationArrivalDate.toIso8601String();
              }
            }
            return fromMatches || inStations;
          }).toList();
        }

        if (selectedTo != null &&
            selectedTo!.isNotEmpty &&
            selectedTo != 'All') {
          data = data.where((travel) {
            bool toMatches = travel['travel_to']
                .toString()
                .toLowerCase()
                .startsWith(selectedTo!.toLowerCase());
            bool inStations = travel['stations']?.any((station) =>
                    station['station_name']
                        .toString()
                        .toLowerCase()
                        .startsWith(selectedTo!.toLowerCase())) ??
                false;

            if (inStations) {
              var station = travel['stations']?.firstWhere((station) =>
                  station['station_name']
                      .toString()
                      .toLowerCase()
                      .startsWith(selectedTo!.toLowerCase()));
              if (station != null) {
                travel['travel_to'] = selectedTo;
              }
            }
            return toMatches || inStations;
          }).toList();
        }

        // البحث بناءً على التاريخ المحدد
        if (selectedDate != null) {
          data = data.where((travel) {
            DateTime travelDate = DateTime.parse(travel['travel_date']);
            return travelDate.year == selectedDate!.year &&
                travelDate.month == selectedDate!.month &&
                travelDate.day == selectedDate!.day;
          }).toList();
        }

        // التأكد أن تاريخ الوصول للمحطة "to" أكبر من تاريخ الوصول للمحطة "from"
        data = data.where((travel) {
          bool isValidRoute = true;

          // إذا كانت هناك محطات "from" و "to"
          if (selectedFrom != null && selectedTo != null) {
            var fromStation = travel['stations']?.firstWhere(
                (station) => station['station_name']
                    .toString()
                    .toLowerCase()
                    .startsWith(selectedFrom!.toLowerCase()),
                orElse: () => null);
            var toStation = travel['stations']?.firstWhere(
                (station) => station['station_name']
                    .toString()
                    .toLowerCase()
                    .startsWith(selectedTo!.toLowerCase()),
                orElse: () => null);

            if (fromStation != null && toStation != null) {
              DateTime fromArrivalDate =
                  DateTime.parse(fromStation['station_arrival_date']);
              DateTime toArrivalDate =
                  DateTime.parse(toStation['station_arrival_date']);

              // التأكد أن تاريخ الوصول للمحطة "to" أكبر من المحطة "from"
              if (toArrivalDate.isBefore(fromArrivalDate)) {
                isValidRoute =
                    false; // لا تقبل هذا السفر إذا كان التوجيه غير صحيح
              }
            }
          }

          return isValidRoute;
        }).toList();

        // إذا كانت البيانات فارغة بعد التصفية
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
