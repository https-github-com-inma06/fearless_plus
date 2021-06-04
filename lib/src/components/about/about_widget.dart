import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key key}) : super(key: key);

  Widget _profile(String image, String name, String position, String birthDay,
      String insUrl, String twiUrl) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: const Color(0xffFF9D6B),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                position,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                birthDay,
                style: TextStyle(color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  right: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/icons/ico_instagram.svg',
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    SvgPicture.asset(
                      'assets/svg/icons/ico_twitter.svg',
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
            color: Colors.white,
            child: CustomScrollView(
              slivers: [
                // SliverPersistentHeader(delegate: delegate),
                SliverToBoxAdapter(),
                SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          child: Row(
                            children: [
                              Padding(padding: EdgeInsets.all(10),
                                child: ClipRRect(
                                  // borderRadius: BorderRadius.circular(0),
                                  child: SvgPicture.asset(
                                    "assets/svg/icons/ico_aboutbg_on.svg",
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),

                              Column(

                                children: [
                                  Text(
                                    "BRAVE GIRLS",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),

                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/icons/ico_instagram.svg',
                                        color: Colors.black,
                                        width: 25,
                                        height: 25,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      SvgPicture.asset(
                                        'assets/svg/icons/ico_twitter.svg',
                                        color: Colors.black,
                                        width: 25,
                                        height: 25,
                                      ),
                                    ],
                                  )

                                ],

                              )
                            ],
                          ),
                        )
                      ],
                    )),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  sliver: SliverGrid(
                      delegate: SliverChildListDelegate([
                        _profile('assets/images/img_min.png1', 'MAINYOUNG',
                            'Main Vocalist', '1990.09.12', '', ''),
                        _profile('assets/images/img_yoo.png1', 'YOOJUNG',
                            'Vocalist', '1991.05.02', '', ''),
                        _profile(
                            'assets/images/img_eun.png1', 'EUNJI', 'Vocalist',
                            '1992.07.19', '', ''),
                        _profile('assets/images/img_yuna.png', 'YUNA-😍',
                            'Lead Vocalist', '1993.04.06', '', ''),
                      ]),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2)),
                )
              ],
            ),
          )),

      /*
      // margin: const EdgeInsets.only(top: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
<<<<<<< HEAD
              _profile('assets/images/img_min.png1', 'MAINYOUNG',
                  'Main Vocalist', '1990.09.12', '', ''),
              _profile('assets/images/img_yoo.png1', 'YOOJUNG', 'Vocalist',
=======
              _profile('assets/images/img_min.png', 'MINYEONG', 'Main Vocalist',
                  '1990.09.12', '', ''),
              _profile('assets/images/img_yoo.png', 'YUJEONG', 'Vocalist',
>>>>>>> dev
                  '1991.05.02', '', ''),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _profile('assets/images/img_eun.png1', 'EUNJI', 'Vocalist',
                  '1992.07.19', '', ''),
<<<<<<< HEAD
              _profile('assets/images/img_yuna.png1', 'YUNA-😍', 'Lead Vocalist',
=======
              _profile('assets/images/img_yuna.png', 'YUNA', 'Lead Vocalist',
>>>>>>> dev
                  '1993.04.06', '', ''),
            ],
          ),
        ],
      ),
      */
    );
  }
}
