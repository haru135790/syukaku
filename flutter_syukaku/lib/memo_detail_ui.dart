import 'package:flutter_syukaku/data_class.dart';
import 'package:flutter/material.dart';

class MemoDetail extends StatefulWidget {
  MemoDetail(this.memo, {super.key});
  final memodata memo;
  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _MemoDetailState createState() => _MemoDetailState(memo);
}



class _MemoDetailState extends State<MemoDetail> {
  memodata memo;
  _MemoDetailState(this.memo);
  bool editMode = false;
  bool changedMemo = false;
  ForPulldownList pulldownList = ForPulldownList();

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
                    Container(//職種
                      color: Colors.blueGrey,
                      height: 50,
                      padding: const EdgeInsets.all(0.0),
                      alignment: Alignment.center,
                      child: Text(
                        memo.jobName,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Container(
                  height: 180,
                  color: Colors.cyanAccent,
                  alignment: Alignment.center,
                  child: Text(
                    memo.industry,
                  ),
                ),
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
                  child: Text(
                    memo.wantRank.toString(),
                    style: TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
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
                  child: Text(
                    memo.statement,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto",
                    ),
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your memo',
                ),
                onChanged: (String value) {
                  memo.companyDescription = value;
                },
              ),
            ),
          ),
        ],
      ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: editMode ? Colors.greenAccent : Colors.deepPurpleAccent,
      onPressed: () {
        setState(() {
                 //編集モードに切り替え　編集モードの場合は保存ボタンを表示
        if (editMode) {
          //保存処理
          if(memo!=editedtump){
            memo = editedtump;
            changedMemo = true;
          }
          editMode = false;
        }else{
          //編集モードに切り替え
          editMode = true;
          
        }
        });
 
      },
      child: Icon(editMode ? Icons.save : Icons.edit),
      ),
    );
  }
}