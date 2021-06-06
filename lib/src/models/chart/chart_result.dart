import 'chart_model.dart';

class ChartResult {
  List<ChartModel> lists;

  ChartResult({
    this.lists,
  });
  factory ChartResult.fromJson(Map<String, dynamic> json) => ChartResult(
        lists: List<ChartModel>.from(
            json["data"]["list"].map((data) => ChartModel.fromJson(data))),
      );
}
