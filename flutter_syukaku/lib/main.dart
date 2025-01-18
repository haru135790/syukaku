import 'package:flutter/rendering.dart';
import 'package:flutter_syukaku/data_class.dart';
import 'package:flutter_syukaku/memo_detail_ui.dart';
import 'package:flutter/material.dart';

void main() {
  debugPaintSizeEnabled=false;
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
memodata test=memodata(companyName: "テストカンパニー", jobName: "テストエンジニア", industry: "テスト業界", wantRank: 1, statement: "テストステートメント");

    return MaterialApp(
      title: 'Generated App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        //accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: MemoDetail(test),
    );
  }
}
