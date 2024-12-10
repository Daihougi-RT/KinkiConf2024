import 'package:flutter/material.dart';
import 'string.dart';
// 以下のimportを追加

class Page1P1 extends StatelessWidget {
  const Page1P1({super.key});
  @override
  Widget build(BuildContext context) {
    //double wid = MediaQuery.of(context).size.width - 50; //画面サイズ取得
    //double high = 50;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), //アプリバーのサイズ
          child: AppBar(
              title: const Text('開催概要'),
              centerTitle: true,backgroundColor: const Color(0xFF47F5E1),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    //ホーム画面に戻る
                    Navigator.popUntil(
                        context, (Route<dynamic> route) => route.isFirst);
                  },
                ),
              ])),
     // backgroundColor: const Color(0xFF50F547), //背景色

      body: Column(
        children: <Widget>[
          Container(
            //color: Colors.blue,
            padding: const EdgeInsets.only(top: 10),
            child: const Text('''Transformation・Innovation''',
              style: TextStyle(
                fontFamily: 'SFProDisplay',
               // color: Color(0xffffffff),
                height: 1.0, // heightプロパティを追加。 任意の値を設定して調整する
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: 0.0075,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible, //ここ！！
            ),
          ),
          const Text(
            ''' ～Let's take a new step～''',
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              //  color: Color(0xffffffff),
              height: 1.2, // heightプロパティを追加。 任意の値を設定して調整する
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.0075,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            //単に間をあける　padding等効かない
            height: 10,
          ),
          const Text(
            '''日 時：令和7年2月9日（日）
              10:00～16:30
               9:30　会場受付開始''',
            style: TextStyle(
              fontFamily: 'SFProDisplay',
            //  color: Color(0xffffffff),
              height: 1.2, // heightプロパティを追加。 任意の値を設定して調整する
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.0075,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            //単に間をあける　padding等効かない
            height: 10,
          ),
          const Text(
            '会 場：グランフロント大阪\nカンファレンスルームタワーC',
            style: TextStyle(
              fontFamily: 'SFProDisplay',
            //  color: Color(0xffffffff),
              height: 1.2, // heightプロパティを追加。 任意の値を設定して調整する
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.0075,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            //単に間をあける　padding等効かない
            height: 10, //コンテナとの間隔
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10.0), //Appバーとの間隔
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),),
                      color: Colors.white,
                    ),
                    //color: Colors.blue,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: const Text(
                      gaiyo,
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Colors.black,
                        fontSize: 20,
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
        ],
      ),
    );
  }
}
