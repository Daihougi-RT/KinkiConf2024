// abstract_page.dart
import 'package:flutter/material.dart';
import 'string_abstract.dart';
import 'page4p1.dart';
import 'utils.dart'; // generateMemoKey関数をインポート

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("プログラム"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionWidget(
                title: "教育講演",
                //theme: "ああああ",
                lectures: educationalLectures,
              ),
              SectionWidget(
                title: "特別講演",
                //theme: "",
                lectures: specialLectures,
              ),
              SectionWidget(
                title: "府民公開講座",
                //theme: "",
                lectures: publicLectures,
              ),
              SectionWidget(
                title: "シンポジウム",
                //theme: "",
                lectures: synpoLectures,
              ),
              SectionWidget(
                title: "ランチョンセミナー",
                //theme: "",
                lectures: lunchLectures,
              ),
              SectionWidget(
                title: "放射線機器管理士部会",
                //theme: "",
                lectures: lunchLectures,
              ),
              SectionWidget(
                title: "一般研究発表1",
                //theme: "",
                lectures: generalResearchPresentations1,
              ),
              SectionWidget(
                title: "一般研究発表2",
               // theme: "",
                lectures: generalResearchPresentations2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// セクションウィジェットを作成
class SectionWidget extends StatelessWidget {
  //final String theme;
  final String title;
  final List<Map<String, dynamic>> lectures;

  const SectionWidget({super.key, required this.title,required this.lectures});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.black12,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ...lectures.map((lecture) => LectureSection(lecture: lecture)),
        const SizedBox(height: 20),
      ],
    );
  }
}

class LectureSection extends StatelessWidget {
  final Map<String, dynamic> lecture;

  const LectureSection({super.key, required this.lecture});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 座長はセクションごとに1回だけ表示する
        if (lecture.containsKey("moderator"))
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "座長: ${lecture["moderator"] ?? ""}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: (lecture["presentations"] as List<Map<String, String>>)
              .map((presentation) => ListTile(
            title: Text("演者: ${presentation["speaker"] }"),
            subtitle: Text("テーマ: ${presentation["theme"] }"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Page4P1(
                    speaker: presentation["speaker"]??"",
                    title: presentation["title"]??"",
                    theme: presentation["theme"]??"",

                    abstract: presentation["abstract"]??"",
                    memoKey: generateMemoKey(presentation["speaker"]!, presentation["theme"]!), // 統一的にキーを生成
                  ),
                ),
              );
            },
          ))
              .toList(),
        ),
        const Divider(), // セクション間の区切り
      ],
    );
  }
}