import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'company_detail.dart';

void main() => runApp(const MyHomePage( title: '就書'));

typedef companydata = ({int columnId, String companyName, String industry, String wantRank});

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;
  List<companydata> companylist = [];

  @override
  void initState() {
    _insert();
    _queryCompanyList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) { /*3*/
    return MaterialApp(  /*4*/
      home: Scaffold( /*5*/
        appBar:AppBar(
          title: Text('就書'),
        ),
        drawer:Drawer(
          child:ListView(
            children:<Widget>[
              DrawerHeader(
                child: Text('メモ一覧'),
                decoration:BoxDecoration(
                  color:Colors.blue,
                ),
              ),
              ListTile(
                title:Text('Item1'),
                onTap:(){
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:Text('Item2'),
                onTap:(){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: companylist.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 1,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple[300],
                child: Icon(Icons.assignment, color: Colors.white),
              ),
              title: Text(
                companylist[index].companyName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "タップして詳細を見る",
                style: TextStyle(color: Colors.grey[600]),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompanyDetail(companylist[index].columnId)),
                );
              },
            ),
          );
        },
      ),
      ),
    );
  }

  Future<void> _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.companyName : '株式会社テスト',
      DatabaseHelper.companyDescription  : 'テスト' ,
      DatabaseHelper.jobName : 'エンジニア',
      DatabaseHelper.industry : '未設定',
      DatabaseHelper.wantRank : 1,
      DatabaseHelper.statement : 'テストデータ'
    };
    final id = await dbHelper.insert(row);
    print('登録しました。id: $id');
  }

  Future<void> _queryCompanyList() async {
    final data = await dbHelper.queryCompanyList();
    print('必要なデータを照会しました。');
    data.forEach((row) {
      companylist.add((
        columnId: row[DatabaseHelper.columnId],
        companyName: row[DatabaseHelper.companyName],
        industry: row[DatabaseHelper.industry],
        wantRank: row[DatabaseHelper.wantRank],
      ));
    });
  }
}
