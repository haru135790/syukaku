import 'package:flutter_syukaku/data_class.dart';
import 'database_helper.dart';
import 'package:flutter/material.dart';

class MemoDetail extends StatefulWidget {
  MemoDetail(this.id, {super.key});
  final int id;
  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _MemoDetailState createState() => _MemoDetailState(id);
}


class _MemoDetailState extends State<MemoDetail> {
  int id;
  late memodata memo;
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  _MemoDetailState(this.id) {
    memo = memoset(id);
  }
  bool editMode = false;
  bool changedMemo = false;
  ForPulldownList pulldownList = ForPulldownList();
 memoset(int i) async {
  Future<Map<String, dynamic>> te = dbHelper.queryRow(i);
  memodata m = await memodata.fromMapAsync(te);
  return m;
}
dataUpdate(memodata m) async {
}
  @override
  Widget build(BuildContext context) {
    
    memodata editedtump = memo;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon : const Icon(Icons.list),
          onPressed: () {
            // 画面遷移
          },
          ),
        centerTitle: true,
        title: Text(memo.companyName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Row(//上ブロック
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 20.0,
                height: 0.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(//企業名
                      color: Colors.blueGrey,
                      height: 50,
                      width: 200.0,
                      padding: const EdgeInsets.all(0.0),
                      alignment: Alignment.center,
                      child: TextField(
                        enabled: editMode,
                        controller: TextEditingController(text: memo.companyName),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto",
                        ),
                        onChanged: (String value) {
                          editedtump.companyName = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      color: Colors.blueGrey,
                      height: 50,
                      padding: const EdgeInsets.all(0.0),
                      alignment: Alignment.center,
                      child: TextField(
                        enabled: editMode,
                        controller: TextEditingController(text: memo.jobName),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto",
                        ),
                        onChanged: (String value) {
                          editedtump.jobName = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(//業界
                child: Container(
                  height: 180,
                  color: Colors.cyanAccent,
                  alignment: Alignment.center,
                  child: editMode ? DropdownButton<String>(
                    value:editedtump.industry,
                    items: pulldownList.getIndustryList().map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        editedtump.industry = value!;
                      });
                    },
                  ) : Text(
                    memo.industry,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto",
                    ),
                ),
                )
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(//志望度、状態
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 30,
                width: 40.0,
              ),
              Expanded(
                child: Container(
                height: 30,

                  color: Colors.blue,
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  child: editMode ? DropdownButton<int>(
                    value:editedtump.wantRank,
                    items: pulldownList.getWantRankList().map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? value) {
                      setState(() {
                        editedtump.wantRank = value!;
                      });
                    },
                  ) : Text(
                    memo.wantRank.toString(),
                    style: TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto",
                    ),
                  ),
                )
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Container(
                height: 30,

                  color: Colors.red,
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                      child: TextField(
                        enabled: editMode,
                        controller: TextEditingController(text: memo.statement),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto",
                        ),
                        onChanged: (String value) {
                          editedtump.statement = value;
                        },
                      ),
                ),
              ),
              SizedBox(
                width: 40.0,
              ),

            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(//概要
            margin: const EdgeInsets.all(12.0),
            child: Scrollbar(

              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 8,
                enabled: editMode,
                controller: TextEditingController(text: editMode ? editedtump.companyDescription ?? "" : memo.companyDescription ?? ""),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your memo',
                ),
                onChanged: (String value) {
                  editedtump.companyDescription = value;
                },
              ),
            ),
          ),
        ],
      ),
 floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: editMode ? Colors.greenAccent : Colors.deepPurpleAccent,
            onPressed: () {
              setState(() {
                // 編集モードに切り替え　編集モードの場合は保存ボタンを表示
                if (editMode) {
                  // 保存処理
                  if (memo != editedtump) {
                    memo = editedtump;
                    changedMemo = true;
                  }
                  editMode = false;
                } else {
                  // 編集モードに切り替え
                  editMode = true;
                }
              });
            },
            child: Icon(editMode ? Icons.save : Icons.edit),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.redAccent,
            onPressed: () {
              // 削除処理
              // ここに削除処理を追加
              ttest();
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
  void ttest()async{
        Map<String, dynamic> row = {
      DatabaseHelper.companyName : '株式会社テスト',
      DatabaseHelper.companyDescription  : 'テスト' ,
      DatabaseHelper.jobName : 'エンジニア',
      DatabaseHelper.industry : 'SIer',
      DatabaseHelper.wantRank : 1,
      DatabaseHelper.statement : 'テストデータ'
    };
  //memodata test=memodata( companyName: "テストカンパニー", jobName: "テストエンジニア", industry: "未設定", wantRank: 1, statement: "テストステートメント");
    final id = await dbHelper.insert(row);
    Future<Map<String, dynamic>> te = dbHelper.queryRow(id);
    memodata test = await memodata.fromMapAsync(te);
    print(test.companyName);
}


void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      ///DatabaseHelper.companyName : memodata.companyName,
      //DatabaseHelper.companyDescription : memodata.companyDescription,
      //中略
    };
    final id = await dbHelper.insert(row);
    print('登録しました。id: $id');
  }
}
