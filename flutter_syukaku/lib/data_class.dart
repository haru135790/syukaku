import 'database_helper.dart';

class memodata {
  int? id;
  String companyName;
  String jobName;
  String industry;
  String companyDescription;
  int wantRank;
  String? selectionStage;
  String? connection;
  String? connectionLink;
  String statement;

  memodata({
    this.id,
    required this.companyName,
    required this.jobName,
    required this.industry,
    this.companyDescription = "",
    required this.wantRank,
    this.selectionStage = "",
    this.connection = "",
    this.connectionLink = "",
    required this.statement,
  });

  // memodata インスタンスをマップに変換するメソッド
  Future<Map<String, dynamic>> toMap()async {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.companyName: companyName,
      DatabaseHelper.jobName: jobName,
      DatabaseHelper.industry: industry,
      DatabaseHelper.companyDescription: companyDescription,
      DatabaseHelper.wantRank: wantRank,
      DatabaseHelper.selectionStage: selectionStage,
      DatabaseHelper.connection: connection,
      DatabaseHelper.connectionLink: connectionLink,
      DatabaseHelper.statement: statement,
    };
  }

  // 初期データ用のマップに変換するメソッド
  Map<String, dynamic> toMapStart() {
    return {
      DatabaseHelper.companyName: companyName,
      DatabaseHelper.jobName: jobName,
      DatabaseHelper.industry: industry,
      DatabaseHelper.companyDescription: companyDescription,
      DatabaseHelper.wantRank: wantRank,
      DatabaseHelper.selectionStage: selectionStage,
      DatabaseHelper.connection: connection,
      DatabaseHelper.connectionLink: connectionLink,
      DatabaseHelper.statement: statement,
    };
  }

  // DatabaseHelper から受け取った値を memodata インスタンスに変換するメソッド
  factory memodata.fromMap(Map<String, dynamic> map) {
    return memodata(
      id: map[DatabaseHelper.columnId],
      companyName: map[DatabaseHelper.companyName],
      jobName: map[DatabaseHelper.jobName],
      industry: map[DatabaseHelper.industry],
      companyDescription: map[DatabaseHelper.companyDescription],
      wantRank: map[DatabaseHelper.wantRank],
      selectionStage: map[DatabaseHelper.selectionStage],
      connection: map[DatabaseHelper.connection],
      connectionLink: map[DatabaseHelper.connectionLink],
      statement: map[DatabaseHelper.statement],
    );
  }

  // 非同期関数を使用して Future<Map<String, dynamic>> を処理するメソッド
  static Future<memodata> fromMapAsync(Future<Map<String, dynamic>> futureMap) async {
    final map = await futureMap;
    return memodata.fromMap(map);
  }
}

class ForPulldownList {
  static const List<String> industryList = [
    "IT",
    "メーカー",
    "商社",
    "金融",
    "メディア",
    "官公庁",
    "物流",
    "その他",
    "未設定"
  ];
  static const List<int> wantRankList = [1, 2, 3, 4];

  List<String> getIndustryList() {
    return industryList;
  }

  List<int> getWantRankList() {
    return wantRankList;
  }
}