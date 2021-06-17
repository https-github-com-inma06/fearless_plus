import 'package:fearlessassemble/src/models/chart/chart_model.dart';

class ChartResult {
  List<ChartModel> lists;

  ChartResult({
    this.lists,
  });

  factory ChartResult.fromJson(Map<String, dynamic> json) {
    try {
      return ChartResult(
        lists: List<ChartModel>.from(
          json["data"]["list"].map(
            (data) => ChartModel.fromJson(data),
          ),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
