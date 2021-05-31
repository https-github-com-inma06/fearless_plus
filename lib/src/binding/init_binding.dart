import 'package:fearlessassemble/src/controller/app_controller.dart';
import 'package:fearlessassemble/src/controller/notification_controller.dart';
import 'package:fearlessassemble/src/repository/campaign_repository.dart';
import 'package:fearlessassemble/src/repository/event_repository.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(NotificationController());
    Get.put(EventRepository(), permanent: true);
    Get.put(CampaignRepository(), permanent: true);
  }
}
