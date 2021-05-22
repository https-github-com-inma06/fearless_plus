import 'package:fearlessassemble/src/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  const Video({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: CustomAppBar(),
            floating: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    color: Colors.grey,
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
