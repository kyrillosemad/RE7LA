import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/core/functions/local_notification/local_notification.dart';
import 'package:re7la/core/services/services.dart';
import 'package:re7la/view%20model/app_states.dart';

class AccountCubit extends Cubit<AppState> {
  AccountCubit() : super(Initial());
  Services services = Get.find<Services>();
  var userId = Get.find<Services>().sharedPref!.getString("userId");
  var userName = Get.find<Services>().sharedPref!.getString("userName");
  var userEmail = Get.find<Services>().sharedPref!.getString("userEmail");
  var userPhone = Get.find<Services>().sharedPref!.getString("userPhone");
  bool value = true;
  logout() {
    services.sharedPref!.clear();
    Get.offAllNamed(AppRoutes().login);
  }

  sendSimpleNotification() async {
    LocalNotificationService.showSimpleNotification(
      title: 'New Notification',
      body: 'This is a simple notification.',
      payload: 'Hello from the notification',
    );
  }

  sendScheduleNotification() {
    DateTime scheduledTime =
        DateTime.now().add(const Duration(seconds: 10)); // بعد 10 ثواني
    LocalNotificationService.showScheduledNotification(
      title: 'Scheduled Notification',
      body: 'This notification is scheduled.',
      scheduledTime: scheduledTime,
    );
  }

  sendRepeatedNotification() {
    LocalNotificationService.showPeriodicNotification(
      title: 'Periodic Notification',
      body: 'This notification repeats every minute.',
      interval: RepeatInterval.everyMinute,
    );
  }

  cancelSpecificNotification() async {
    int notificationId = 1; // 2 for schedule 3 for repeated
    await LocalNotificationService.cancelNotification(notificationId);
  }

  disableNotifications() async {
    value = false;
    LocalNotificationService.toggleNotifications(false);
    Get.snackbar("Done", "Notifications have been stopped .",
        backgroundColor: AppColor.secondColor.withOpacity(0.6),
        colorText: Colors.white);
    emit(Initial());
  }

  activateNotifications() {
    value = true;
    Get.snackbar("Done", "Notifications have been Activated.",
        backgroundColor: AppColor.secondColor.withOpacity(0.6),
        colorText: Colors.white);
    LocalNotificationService.toggleNotifications(true);
    emit(Initial());
  }
}
