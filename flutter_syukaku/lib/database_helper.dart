import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {  
  static final _databaseName = "companys.db"; // DB名
  static final _databaseVersion = 1;

  static final table = 'main_table'; // テーブル名
  static final columnId = '_id'; // カラム名：ID
  static final companyName = 'companyName'; // 会社名
  static final jobName = 'jobName'; // 職種
  static final industry = 'industry'; // 業界
  static final companyDescription = 'companyDescription'; // 会社説明
  static final wantRank = 'wantRank'; // 志望度
  static final selectionStage = 'selectionStage'; // 選考ステージ
  static final connection = 'connection'; // 連絡ツール、仲介サービス名など
  static final connectionLink = 'connectionLink'; // 連絡ツール、仲介サービスのリンク
  static final statement = 'statement'; // ステートメント

  // DatabaseHelper クラスを定義
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // databaseメソッド定義
  // 非同期処理
  Future<Database?> get database async {
    // _databaseがNULLか判定
    // NULLの場合、_initDatabaseを呼び出しデータベースの初期化し、_databaseに返す
    // NULLでない場合、そのまま_database変数を返す
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // データベース接続
  _initDatabase() async {
    // アプリケーションのドキュメントディレクトリのパスを取得
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // 取得パスを基に、データベースのパスを生成
    String path = join(documentsDirectory.path, _databaseName);
    // データベース接続
    return await openDatabase(path,
        version: _databaseVersion,
        // テーブル作成メソッドの呼び出し
        onCreate: _onCreate);
  }

  // テーブル作成
  // 引数:dbの名前
  // 引数:スキーマーのversion
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $companyName TEXT NOT NULL,
            $jobName TEXT NOT NULL,
            $industry TEXT NOT NULL,
            $companyDescription TEXT NOT NULL,
            $wantRank INTEGER NOT NULL,
            $connection TEXT,
            $connectionLink TEXT,
            $statement TEXT
          )
          ''');
  }

  // レコード追加
  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  // 全データ取得
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }
    
  // idと会社名、職種と希望度のリストを取得
  Future<List<Map<String, dynamic>>> queryCompanyList() async {
    Database? db = await instance.database;
    return await db!.query(table, columns: [columnId, companyName, industry, wantRank]);
  }

  // レコード数を確認
   Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  //　更新処理
   Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // 指定IDのレコード削除
   Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}