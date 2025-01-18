import 'package:flutter/material.dart';

class MemoDetail extends StatefulWidget {
  const MemoDetail({Key? key}) : super(key: key);
  @override
  _MemoDetailState createState() => _MemoDetailState();
}

class _MemoDetailState extends State<MemoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: Icon(Icons.list),
        centerTitle: true,
        title: Text('会社名'),
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
                    Container(
                      color: Colors.blueGrey,
                      height: 50,
                      width: 200.0,
                      padding: const EdgeInsets.all(0.0),
                      alignment: Alignment.center,
                      child: Text(
                        "会社名",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto",
                        ),
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
                      child: Text(
                        "職種",
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
                    "業界名",
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
                    "志望度",
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
                    "状態",
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}