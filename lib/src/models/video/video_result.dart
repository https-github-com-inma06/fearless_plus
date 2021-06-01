import 'video_model.dart';

class VideoResult {
  List<VideoModel> lists;

  VideoResult({
    this.lists,
  });

  factory VideoResult.fromJson(Map<String, dynamic> json) => VideoResult(
        lists: List<VideoModel>.from(
            json["data"]["list"].map((data) => VideoModel.fromJson(data))),
      );
}
