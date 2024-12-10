import 'package:flutter/material.dart';
import 'string_abstract.dart';
import 'page4p1.dart';
import 'dart:collection'; //SplayTreeMap for sorting
import 'utils.dart'; // generateMemoKey関数をインポート

// 各データリストから講師と座長の情報を抽出し、Mapに格納する
Map<String, Map<String, String>> extractSpeakers() {
  Map<String, Map<String, String>> speakers = {};

  // 各セッション（例: educationalLectures）から講師と座長を抽出
  for (var lectureData in [educationalLectures, specialLectures, publicLectures, synpoLectures,
    lunchLectures, generalResearchPresentations1, generalResearchPresentations2]) {
    for (var lecture in lectureData) {
      // 座長情報を追加
      final moderator = lecture["moderator"];
      final moderatorJ = lecture["moderator-j"];
      final moderatorE = lecture["moderator-e"];
      if (moderatorJ != null && moderatorE != null) {
        speakers[moderatorE] = {
          "role": "座長",
          "name": moderator,
          "nameJ": moderatorJ,
          "nameE": moderatorE,
          "theme": lecture["theme"] ?? "",
          //"title": lecture["title"] ?? "",
          "abstract": "", // 座長に抄録はないため空
        };
      }

      // 講演情報を追加
      for (var presentation in lecture["presentations"]) {
        final speaker = presentation["speaker"];
        final speakerJ = presentation["speaker-j"];
        final speakerE = presentation["speaker-e"];
        String generateMemoKey(String name, String title) {
          return "memo_${name}_$title";
        }

        if (speakerJ != null && speakerE != null) {
          speakers[speakerE] = {
            "role": "講師",
            "name": speaker,
            "nameJ": speakerJ,
            "nameE": speakerE,
            "theme": presentation["theme"] ?? "",
            "abstract": presentation["abstract"] ?? "",
          };
        }
      }
    }
  }

  return speakers;
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
  // 講師・座長データを取得してソート
  final speakersMap = extractSpeakers();
  final sortedSpeakers = SplayTreeMap<String, Map<String, String>>.from(
  speakersMap,
  (a, b) => a.compareTo(b),
  );

  return Scaffold(
    appBar: AppBar(
      title: const Text("演者・座長リスト"),
    ),
    body: ListView.builder(
      itemCount: sortedSpeakers.length,
      itemBuilder: (context, index) {
        // ソート後のキー（ローマ字名）と値（役割、和名、タイトル、抄録）を取得
        String nameE = sortedSpeakers.keys.elementAt(index);
        String role = sortedSpeakers[nameE]?["role"] ?? "";
        String name = sortedSpeakers[nameE]?["name"] ?? "";
        String nameJ = sortedSpeakers[nameE]?["nameJ"] ?? "";
        String theme = sortedSpeakers[nameE]?["theme"] ?? "";
        String title = sortedSpeakers[nameE]?["title"] ?? "";
        String abstractContent = sortedSpeakers[nameE]?["abstract"] ?? "";

        return Container(
          color: index % 2 == 0 ? Colors.blue[50] : Colors.yellow[50],
          child: ListTile(
            leading: Icon(
              role == "講師" ? Icons.mic : Icons.person,
              color: role == "講師" ? Colors.blue : Colors.green,
            ),
            title: Row(
              children: [
                Text(
                  nameE, // ローマ字表記
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8), // 間隔
                Text(
                  nameJ, // 日本語表記
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
            //subtitle: Text(role), // 「講師」または「座長」の役割表示
            onTap: () {
              // タップ時にAbstractDetailPageに遷移（講師のみ）
              if (role == "講師") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page4P1(
                      speaker: name,
                      title: title,
                      theme:theme,
                      abstract: abstractContent,
                      memoKey: generateMemoKey(name, theme), // generateMemoKeyを使用

                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    ),
  );
  }
}