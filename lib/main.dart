//import 'dart:io';
//import 'package:image_size_getter/image_size_getter.dart';
//import 'package:image_size_getter/file_input.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import 'package:main.dart';
//import 'package:page1.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';
import 'page5.dart';
import 'page7.dart';
//import 'package:logger/logger.dart';

final now = DateTime.now().toLocal();

final kaisaiDay = DateTime(2025, 02, 09); //11/20 10:30開始
final todayDay = DateTime(now.year, now.month, now.day);
final diffDay = kaisaiDay.difference(todayDay).inDays;

final kaisaiTime = DateTime(2025, 02, 09, 9, 30); //11/20 10:30開始
final kaisaiMin = kaisaiTime.hour * 60 + kaisaiTime.minute;
final todayMin = now.hour * 60 + now.minute;
final diffMin = kaisaiMin - todayMin;
const underArea = 70;

String hyouJi() {
  if (diffDay > 0) {
    return '開催まであと$diffDay日';
  } else if (diffDay < -1) {
    return 'ご参加いただきありがとうございました';
  } else if (diffMin > 60) {
    return '本日開催です';
  } else if (diffMin > 0) {
    return 'まもなく始まります';
  } else if (diffMin > -600) {
    //終了時間を計算して入れる
    return '';
  } else {
    return 'ご参加いただきありがとうございました';
  }
}
final String hyouji = hyouJi();
//final Duration difference = DateTime.now().toLocal().difference(kaisaiDay);

//if (0 >diffMin > -600) {
 // underArea = 35;
//}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kinki Conf. 2024",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size; //画面サイズ取得
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    double areaHei = screenHeight -(screenWidth/1102*701);
    //1102*701はcover1のサイズ
    double imgHei = areaHei/3-underArea;
    double imgWid = screenWidth/2-70;
    double high = 30;  // 説明文の高さ
    //var logger = Logger();
    //logger.d(high);
    //logger.d(imgHei);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.title,
          //textAlign: TextAlign.center, //センタリング効かない
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF99FFE6), //背景色
      extendBodyBehindAppBar: true,
      body: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/cover0.jpg'),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //ボタン1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(    //ご案内
                        height: imgHei,
                        width: imgWid,
                        margin: const EdgeInsets.only(top: 0.0),
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: Image.asset('assets/images/cover1.png'),
                          ),
                          onTap: () {
                            //指定した画面に遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // ボタン2で遷移するページ
                                  builder: (context) => const Page1()),
                            );
                          },
                        ),
                      ),
                      Container(    //会場案内
                        height: imgHei,
                        width: imgWid,
                        margin: const EdgeInsets.only(top: 0.0),
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: Image.asset('assets/images/cover2.png'),

                          ),
                          onTap: () {
                            //指定した画面に遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // ボタン2で遷移するページ
                                  builder: (context) => const Page2()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: high,
                        width: imgWid,
                        alignment: Alignment.topCenter,
                        //margin: const EdgeInsets.only(top: 0.0),
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: const AutoSizeText(
                              //ボタン1の下
                              'ご案内',
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xFF6315E2),
                                height: 1.6, // heightプロパティを追加。 任意の値を設定して調整する
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.01,
                              ),
                              //textAlign: TextAlign.right,
                            ),
                          ),
                          onTap: () {
                            //指定した画面に遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // ボタン2で遷移するページ
                                  builder: (context) => const Page1()),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: high,
                        width: imgWid,
                        alignment: Alignment.topCenter,
                        //margin: const EdgeInsets.only(top: 0.0),
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: const AutoSizeText(
                              //ボタン2の下
                              '会場案内',
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xFF6315E2),
                                height: 1.6, // heightプロパティを追加。 任意の値を設定して調整する
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.01,
                              ),
                              //textAlign: TextAlign.right,
                            ),
                          ),
                          onTap: () {
                            //指定した画面に遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // ボタン2で遷移するページ
                                  builder: (context) => const Page2()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    //単に間をあける　padding等効かない
                    height: 0,
                  ),
                  //ボタン3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(   //タイムテーブル
                        height: imgHei,
                        width: imgWid,
                        margin: const EdgeInsets.only(top: 0.0),
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 00),
                            child: Image.asset('assets/images/cover3.png'),
                          ),
                          onTap: () {
                            //指定した画面に遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // ボタン3で遷移するページ
                                  builder: (context) => const Page3()),
                            );
                          },
                        ),
                      ),
                      Container(    //プログラム・抄録
                        height: imgHei,
                        width: imgWid,
                        margin: const EdgeInsets.only(top: 0.0),
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 00),
                            child: Image.asset('assets/images/cover4.png'),
                          ),
                          onTap: () {
                            //指定した画面に遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // ボタン4で遷移するページ
                                  builder: (context) => const Page4()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: high,
                        width: imgWid,
                        alignment: Alignment.topCenter,
                        //margin: const EdgeInsets.only(top: 0.0),
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: const AutoSizeText(
                              //ボタン3の下
                              'タイムテーブル',
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xFF6315E2),
                                height: 1.6, // heightプロパティを追加。 任意の値を設定して調整する
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.01,
                              ),
                              //textAlign: TextAlign.right,
                            ),
                          ),
                          onTap: () {
                            //指定した画面に遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // ボタン2で遷移するページ
                                  builder: (context) => const Page3()),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: high,
                        width: imgWid,
                        alignment: Alignment.topCenter,
                        //margin: const EdgeInsets.only(top: 0.0),
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: const AutoSizeText(
                              //ボタン4の下
                              'プログラム・抄録',
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xFF6315E2),
                                height: 1.6, // heightプロパティを追加。 任意の値を設定して調整する
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.01,
                              ),
                              //textAlign: TextAlign.right,
                            ),
                          ),
                          onTap: () {
                            //指定した画面に遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // ボタン4で遷移するページ
                                  builder: (context) => const Page4()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    //単に間をあける　padding等効かない
                    height: 0,
                  ),
                  //ボタン4
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: imgHei,
                        width: imgWid,
                        margin: const EdgeInsets.only(top: 0.0),
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: Image.asset('assets/images/cover5.png'),
                          ),
                          onTap: () {
                            //指定した画面に遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // ボタン5で遷移するページ
                                  builder: (context) => const Page5()),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: imgHei,
                        width: imgWid,
                        margin: const EdgeInsets.only(top: 0.0),
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: Image.asset('assets/images/cover6.png'),
                          ),
                          onTap: () {
                            //指定した画面に遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // ボタン6で遷移するページ
                                  builder: (context) => const Page7()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: high,
                        width: imgWid,
                        alignment: Alignment.topCenter,
                        //margin: const EdgeInsets.only(top: 0.0),
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: const AutoSizeText(
                              //ボタン5の下
                              '演者・座長',
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xFF6315E2),
                                height: 1.6, // heightプロパティを追加。 任意の値を設定して調整する
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.01,
                              ),
                              //textAlign: TextAlign.right,
                            ),
                          ),
                          onTap: () {
                            //指定した画面に遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // ボタン4で遷移するページ
                                  builder: (context) => const Page5()),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: high,
                        width: imgWid,
                        alignment: Alignment.topCenter,
                        //margin: const EdgeInsets.only(top: 0.0),
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: const AutoSizeText(
                              //ボタン6の下
                              '優秀演題投票',
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xFF6315E2),
                                height: 1.6, // heightプロパティを追加。 任意の値を設定して調整する
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.01,
                              ),
                              //textAlign: TextAlign.right,
                            ),
                          ),
                          onTap: () {
                            //指定した画面に遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // ボタン4で遷移するページ
                                  builder: (context) => const Page7()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    //単に間をあける　padding等効かない
                    height: 20,
                  ),
                  //ボタン6
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        //color: Colors.red,
                        height: 50,
                        //padding: const EdgeInsets.only(bottom: 16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          //ボタン2の下
                          hyouji, //******************** */
                          style: const TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xFFE21515),
                            height: 1.6, // heightプロパティを追加。 任意の値を設定して調整する
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.01,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    //単に間をあける　padding等効かない
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
