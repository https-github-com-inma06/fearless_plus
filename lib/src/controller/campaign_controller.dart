import 'package:fearlessassemble/src/models/campaign/campaign_result.dart';
import 'package:fearlessassemble/src/repository/campaign_repository.dart';
import 'package:get/get.dart';

class CampaignController extends GetxController {
  static CampaignController get to => Get.find();

  Rx<CampaignResult> campaignResponseResult = CampaignResult().obs;

  @override
  void onInit() {
    _campaignLoad();
    super.onInit();
  }

  void _campaignLoad() async {
    CampaignResult campaignResult = await CampaignRepository.to.loadCampaign();
    print("event api response : ${campaignResult.lists.length}");

    if (campaignResult != null &&
        campaignResult.lists != null &&
        campaignResult.lists.length > 0) {
      campaignResponseResult(campaignResult);
    }
  }
}
