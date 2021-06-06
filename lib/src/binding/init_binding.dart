import 'package:fearlessassemble/src/chart_controller/app_controller.dart';
import 'package:fearlessassemble/src/chart_controller/notification_controller.dart';
import 'package:fearlessassemble/src/repository/campaign_repository.dart';
import 'package:fearlessassemble/src/repository/event_repository.dart';
import 'package:fearlessassemble/src/repository/video_repository.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(NotificationController());
    Get.put(EventRepository(), permanent: true);
    Get.put(VideoRepository(), permanent: true);
    Get.put(CampaignRepository(), permanent: true);
  }
}
