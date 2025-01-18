import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // このウィジェットはアプリケーションのルートです。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter デモ',
      theme: ThemeData(
        // これはアプリケーションのテーマです。
        //
        // 試してみてください: "flutter run" でアプリケーションを実行してみてください。
        // アプリケーションには紫色のツールバーが表示されます。
        // アプリを終了せずに、以下の colorScheme の seedColor を Colors.green に変更して、
        // "hot reload" を実行してみてください（変更を保存するか、Flutter 対応の IDE で
        // "hot reload" ボタンを押すか、コマンドラインでアプリを開始した場合は "r" を押します）。
        //
        // カウンターがゼロにリセットされないことに注目してください。
        // リロード中にアプリケーションの状態は失われません。
        // 状態をリセットするには、代わりにホットリスタートを使用してください。
        //
        // これは値だけでなくコードにも適用されます: ほとんどのコード変更は
        // ホットリロードだけでテストできます。
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter デモ ホームページ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // このウィジェットはアプリケーションのホームページです。
  // これはステートフルであり、見た目に影響を与えるフィールドを含む State オブジェクトを持ちます。

  // このクラスは状態の設定です。これは親（この場合は App ウィジェット）から提供され、
  // State の build メソッドで使用される値（この場合はタイトル）を保持します。
  // Widget サブクラスのフィールドは常に "final" とマークされます。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // この setState の呼び出しは、Flutter フレームワークにこの State で何かが変更されたことを伝え、
      // それにより build メソッドが再実行され、表示が更新された値を反映するようになります。
      // setState() を呼び出さずに _counter を変更した場合、build メソッドは再度呼び出されず、
      // 何も起こらないように見えます。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // このメソッドは setState が呼び出されるたびに再実行されます。
    // 例えば、上記の _incrementCounter メソッドによって呼び出されます。
    //
    // Flutter フレームワークは、ビルドメソッドを再実行することを最適化しているため、
    // 更新が必要なものを個別に変更するのではなく、必要なものをすべて再構築することができます。
    return Scaffold(
      appBar: AppBar(
        // 試してみてください: ここで色を特定の色（例えば Colors.amber）に変更して、
        // ホットリロードをトリガーして、AppBar の色が他の色と同じままであることを確認してください。
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // ここでは、App.build メソッドによって作成された MyHomePage オブジェクトの値を取得し、
        // それを使用して appbar のタイトルを設定します。
        title: Text(widget.title),
      ),
      body: Center(
        // Center はレイアウトウィジェットです。単一の子を取り、それを親の中央に配置します。
        child: Column(
          // Column もレイアウトウィジェットです。子のリストを取り、それらを垂直に配置します。
          // デフォルトでは、子を水平にフィットするようにサイズを設定し、親と同じ高さにしようとします。
          //
          // Column には、サイズを設定する方法や子を配置する方法を制御するためのさまざまなプロパティがあります。
          // ここでは mainAxisAlignment を使用して、子を垂直に中央に配置します。
          // ここでの主軸は垂直軸です。なぜなら、Column は垂直だからです（交差軸は水平になります）。
          //
          // 試してみてください: "デバッグペイント" を呼び出して（IDE で "Toggle Debug Paint" アクションを選択するか、
          // コンソールで "p" を押します）、各ウィジェットのワイヤーフレームを確認してください。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ボタンを押した回数:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'インクリメント',
        child: const Icon(Icons.add),
      ), // この末尾のカンマは、ビルドメソッドの自動フォーマットをより良くします。
    );
  }
}
