import 'package:fearlessassemble/src/models/campaign/campaign_model.dart';

class CampaignResult {
  List<CampaignModel> lists;

  CampaignResult({
    this.lists,
  });
  factory CampaignResult.fromJson(Map<String, dynamic> json) => CampaignResult(
        lists: List<CampaignModel>.from(
            json["data"]["list"].map((data) => CampaignModel.fromJson(data))),
      );
}
