import 'package:flutter/material.dart';
//import 'page1.dart';
import 'package:logger/logger.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    double imageWidth = 1000;  //タイムテーブルの画像サイズ
    double imageHeight = 1500;
    double appbarSize = 50;    //アプリバーサイ
    Size screenSize = MediaQuery.of(context).size; //画面サイズ取得
    //double screenWidth = screenSize.width;
    double screenHeight = screenSize.height-appbarSize;// 50アプリバーサイズを引く
    double screenWidth = screenSize.width;
    double posLeft= 15*screenWidth/imageWidth;//15は余白部分のピクセル数
    double barSize = screenHeight/imageHeight*imageWidth-50;//55;

    int kaishijifun = 8 * 60 + 30;//540
    int owarijifun = 16 * 60;//960
    int kaisaijikan =owarijifun-kaishijifun;//420
    var now = DateTime.now();//add(const Duration(hours: 9));
    int nowjifun = now.hour*60+now.minute;
    int jifun = nowjifun-kaishijifun;
    double posVertical = screenHeight/kaisaijikan*jifun;
    var logger = Logger();
    logger.d('時間: $now');
    logger.d('posVertical: $posVertical, screenHeight: $screenHeight, screenWidth: $screenWidth');

    //String nowiso =now.toIso8601String();

    //double scale = 1.0; //Scaleのスケール値
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(appbarSize), //アプリバーのサイズ
          child: AppBar(
            title: const Text('タイムテーブル'),
            //title: Text(nowiso),
            centerTitle: true,
          )),
      body: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(20.0),
          minScale: 1.0,
          maxScale: 3.0,
        child: Row(
          children: <Widget>[
         Stack(
          children: [
        // The image should be the first child, so it's drawn below the red line
          Container(
           padding: const EdgeInsets.only(bottom: 20),
           height: screenHeight,
           width: screenWidth,
           child: FittedBox(
             fit: BoxFit.contain,
             child: Image.asset('assets/images/timetable.jpg'),
           ),
          ),
      // The red line should be drawn on top of the image
          Positioned(
            top: posVertical,
            left: posLeft,
             child: Container(
              width: barSize,
              height: 4,
              color: Colors.red.withOpacity(0.4),
         ),
       ),
      ],
    )
          ],
        ),
      ),
      //bottomNavigationBar: bottomButton(context),
    );
  }
}
