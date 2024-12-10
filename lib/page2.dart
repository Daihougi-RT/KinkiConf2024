import 'package:flutter/material.dart';
import 'page2p1.dart';
//import 'package:page2p2.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    //double wid = MediaQuery.of(context).size.width - 50; //画面サイズ取得
    //double high = 50;
    // double pos1 = (width / 2) - 10;
    //double scale = 1.0; //Scaleのスケール値
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), //アプリバーのサイズ
          child: AppBar(
            title: const Text('会場周辺図'),
            centerTitle: true,
          )),
      body: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(10.0),
              minScale: 0.5,
              maxScale: 3.0,
              //panEnabled: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Image.asset('assets/images/map.jpg'),],),
      ),

      bottomNavigationBar: bottomButton(context),
    );
  }

  Widget bottomButton(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      child: TextButton.icon(
        icon: Image.asset('assets/images/iMap.png'),
        label: const Text(
          "地図アプリを開く",
          style: TextStyle(
            height: 2.0,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        style: TextButton.styleFrom(
          foregroundColor: Colors.blue, alignment: Alignment.center,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                // ボタン1で遷移するページ
                builder: (context) => const Page2P1()),
          );
        },
      ),
    );
  }
}
