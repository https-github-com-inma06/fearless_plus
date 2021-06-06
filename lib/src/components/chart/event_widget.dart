// import 'dart:ui';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// class ChartWidget extends StatefulWidget {
//   // final ChartModel chart;
//   // pages - campaign_model.dart 에서  넘겨 받음
//   const ChartWidget({Key key, this.chart}) : super(key: key);
//
//   @override
//   ChartWidgettState createState() => ChartWidgettState();
// }
//
// class ChartWidgettState extends State<ChartWidget> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Widget _thumbnail() {
//     return Container(
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(24),
//         child: CachedNetworkImage(
//           width: Get.context.width,
//           fit: BoxFit.fitWidth,
//           imageUrl: widget.chart.thumbnailImg == null
//               ? ""
//               : widget.chart.thumbnailImg,
//           errorWidget: (context, url, error) => SvgPicture.asset(
//             "assets/svg/icons/null-img.svg",
//           ),
//           placeholder: (context, url) => ClipRRect(
//             borderRadius: BorderRadius.circular(24),
//             child: Container(
//               height: 278.5,
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _simpleDetailInfo() {
//     return Container(
//       margin: const EdgeInsets.only(top: 16, bottom: 10, left: 16, right: 16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Text(
//             widget.chart.title == null ? "이벤트 제목이 없습니다" : widget.chart.title,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             maxLines: 1,
//           ),
//           Text(
//             widget.chart.description == null ? "" : widget.chart.description,
//             maxLines: 1,
//           ),
//           Text(
//             widget.chart.startTime == null
//                 ? ""
//                 : "${widget.chart.startTime} ~ ${widget.chart.endTime}",
//             style: TextStyle(color: Colors.black26),
//             maxLines: 1,
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           _thumbnail(),
//           _simpleDetailInfo(),
//         ],
//       ),
//     );
//   }
// }
