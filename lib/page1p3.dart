import 'package:flutter/material.dart';
//import 'string.dart';

String title1 = "";
String naiyo = "";

class Page1P3 extends StatelessWidget {
  final int? count;
  const Page1P3({super.key, this.count});

  @override
  Widget build(BuildContext context) {
    //double wid = MediaQuery.of(context).size.width - 50; //画面サイズ取得
    //double high = 50;
    if (count == 2) {
      title1 = "参加者の皆様へ";
      naiyo = "assets/images/sanka.png";
    } else if(count == 3){
      title1 = "演者の皆さま";
      naiyo = "assets/images/speaker.png";
    } else if(count == 4){
      title1 = "ランチョンセミナーのご案内";
      naiyo = "assets/images/speaker.png"; //lunch
    } else if(count == 5){
      title1 = "実行委員";
      naiyo = "assets/images/iin.png";
    } else{
      title1 = "予稿集掲載会社";
      naiyo = "assets/images/keisai.png";
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), //アプリバーのサイズ
          child:
              AppBar(title: Text(title1), centerTitle: true,backgroundColor: const Color(
                  0xFFCCF192), actions: <Widget>[
               IconButton(
                 icon: const Icon(Icons.home),
                 onPressed: () {
                //ホーム画面に戻る
                 Navigator.popUntil(
                    context, (Route<dynamic> route) => route.isFirst);
              },
            ),
          ])),
      //backgroundColor: const Color(0xFF50F547), //背景色

      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(10.0),
        minScale: 0.5,
        maxScale: 3.0,
        //panEnabled: true,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.asset(naiyo),
        ),
      ),
    );
  }
}
