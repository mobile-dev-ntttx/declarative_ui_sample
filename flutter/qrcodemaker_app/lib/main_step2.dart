import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QRコード生成アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QRコード生成アプリ'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextFormField(
              // controller: _textController,
              decoration: const InputDecoration(
                hintText: '文字を入力してください',
              ),
            ),
            ElevatedButton(
              onPressed:() {
                // 画面を更新します。
                // _refreshData();
              },
              child: Text('生成'),
            ),
            // QRコードの表示部
            _createQrCode(),
          ],
        ),
      ),
    );
  }
}

/**
 * QRコードを生成します。
 * (現時点では、空のコンテナを返却するだけの実装)
 */
Widget _createQrCode() {
  return Container();
}
