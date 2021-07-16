import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuChartWidget extends StatefulWidget {
  const MenuChartWidget({Key key}) : super(key: key);

  @override
  MenuChartWidgetState createState() => MenuChartWidgetState();
}

class MenuChartWidgetState extends State<MenuChartWidget> {
  var isSelectedBreakfast = false;
  var isSelectedLunch = false;
  var isSelectedDiner = false;
  var breakIcon = Icons.favorite_border;
  var lunchIcon = Icons.favorite_border;
  var dinerIcon = Icons.favorite_border;

  @override
  void initState() {
    super.initState();
  }

  Widget _menu() {
    return Column(
      children: [
        Container(
          height: Get.height * 0.2,
          width: Get.width,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ('조식'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          '828',
                          style: TextStyle(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'kcal',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Container(
                color: Colors.black38,
                width: 1,
                height: Get.height * 0.2,
              ),
              SizedBox(
                width: 50,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('율무밥'),
                            IconButton(
                                icon: Icon(breakIcon),
                                color: Colors.red,
                                onPressed: () {
                                  setState(() {
                                    isSelectedBreakfast = !isSelectedBreakfast;
                                    breakIcon = isSelectedBreakfast
                                        ? Icons.favorite
                                        : Icons.favorite_border;
                                  });
                                }

                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('종류'), // 속성
                          Text('밥류'), // 값
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('재료'),
                          Text('흰쌀'), // 값
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('정량'),
                          Text('210g'), // 값
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('칼로리'),

                          Text('130 kcal'), // 값
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        _borderLine(),
        Container(
          height: Get.height * 0.2,
          width: Get.width,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ('중식'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          '781',
                          style: TextStyle(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'kcal',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Container(
                color: Colors.black38,
                width: 1,
                height: Get.height * 0.2,
              ),
              SizedBox(
                width: 50,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('열무보리비빔밥'),
                            IconButton(
                                icon: Icon(lunchIcon),
                                color: Colors.red,
                                onPressed: () {
                                  setState(() {
                                    isSelectedLunch = !isSelectedLunch;
                                    lunchIcon = isSelectedLunch
                                        ? Icons.favorite
                                        : Icons.favorite_border;
                                  });
                                }

                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('종류'), // 속성
                          Text('밥류'), // 값
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('재료'),
                          Text('보리쌀'), // 값
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('정량'),
                          Text('210g'), // 값
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('칼로리'),
                          Text('130 kcal'), // 값
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        _borderLine(),
        Container(
          height: Get.height * 0.2,
          width: Get.width,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ('석식'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          '724',
                          style: TextStyle(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'kcal',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Container(
                color: Colors.black38,
                width: 1,
                height: Get.height * 0.2,
              ),
              SizedBox(
                width: 50,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('찹쌀땅콩밥'),
                          IconButton(
                              icon: Icon(dinerIcon),
                              color: Colors.red,
                              onPressed: () {
                                setState(() {
                                  isSelectedDiner = !isSelectedDiner;
                                  dinerIcon = isSelectedDiner
                                      ? Icons.favorite
                                      : Icons.favorite_border;
                                });
                              }

                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('종류'), // 속성
                          Text('밥류'), // 값
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('재료'),
                          Text('찹쌀, 땅콩'), // 값
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('정량'),
                          Text('210g'), // 값
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('칼로리'),
                          Text('130 kcal'), // 값
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        _borderLine(),
      ],
    );
  }

  Widget _chart() {
    return Container(
      height: 400,
      child: Text(
        '차트 영역',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _borderLine() {
    return Container(
      width: Get.width,
      height: 1,
      color: Colors.black38,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: ListView(
        children: <Widget>[
          _menu(),
          _chart(),
        ],
      ),
    );
  }
}
