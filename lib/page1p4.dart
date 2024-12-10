import 'package:flutter/material.dart';
import 'string.dart';

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
      naiyo = sanka;
    } else if(count == 3){
      title1 = "演者";
      naiyo = speaker;
    } else if(count == 4){
      title1 = "ランチョンセミナーのご案内";
      naiyo = lunch;
    } else if(count == 5){
      title1 = "実行委員";
      naiyo = iin;
    } else{
      title1 = "予稿集掲載会社";
      naiyo = keisai;
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

      body: Column(
        children: <Widget>[
          Row(
            //スクロールすると上に上がるのを防ぐため
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 15.0),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              //padding: const EdgeInsets.all(15.0), //Appバーとの間隔
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //color: Colors.blue,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      naiyo,
                      style: const TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.0075,
                      ),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible, //ここ！！
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            //スクロールすると上に上がるのを防ぐため　単なるスペーサー
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 10.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
