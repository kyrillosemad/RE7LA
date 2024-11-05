sealed class AppState {}

final class Initial extends AppState {
  Initial();
}

class Loading extends AppState {}

class Success<T> extends AppState {
  late T data;
  Success(this.data);
}

class SelectedDate extends AppState {}

class Empty extends AppState {}

class ServerError extends AppState {}

class InternetError extends AppState {}

class GeneralError extends AppState {}
