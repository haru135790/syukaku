import 'package:flutter/rendering.dart';
import 'package:flutter_syukaku/data_class.dart';
import 'package:flutter_syukaku/jpcome.dart';
import 'package:flutter_syukaku/memo_detail_ui.dart';
import 'package:flutter_syukaku/Companylist.dart';
import 'package:flutter/material.dart';
import 'database_helper.dart';


  DatabaseHelper dbHelper = DatabaseHelper.instance;

class CompanyDetail extends StatelessWidget {
  const CompanyDetail(this.id,{Key? key}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Generated App',
      theme: ThemeData(

      ),
      home: MemoDetail(id),

    );
  }


  // 登録ボタンクリック
  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.companyName : '株式会社テスト',
      DatabaseHelper.companyDescription  : 'テスト' ,
      DatabaseHelper.jobName : 'エンジニア',
      DatabaseHelper.industry : 'SIer',
      DatabaseHelper.wantRank : 1,
      DatabaseHelper.statement : 'テストデータ'
    };
    final id = await dbHelper.insert(row);
    print('登録しました。id: $id');
  }

  // 照会ボタンクリック
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('全てのデータを照会しました。');
    allRows.forEach(print);
  }

  // 更新ボタンクリック
  void _update() async {
     Map<String, dynamic> row = {
      DatabaseHelper.columnId   : 1,
      DatabaseHelper.companyName : '有限会社example',
      DatabaseHelper.companyDescription  : 'テスト' 
    };
    final rowsAffected = await dbHelper.update(row);
    print('更新しました。 ID：$rowsAffected ');
  }

  // 削除ボタンクリック
  void _delete() async {
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id!);
    print('削除しました。 $rowsDeleted ID: $id');
  }
}
