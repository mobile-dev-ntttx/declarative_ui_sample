import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TextEditingController _textController;
  // テキストフィードに入力された文字列
  String _data = "";

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
              controller: _textController,
              decoration: const InputDecoration(
                hintText: '文字を入力してください',
              ),
            ),
            ElevatedButton(
              onPressed:() {
                // 画面を更新します。
                _refreshData();
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

  /**
   * QRコードを生成します。
   * (空文字でない場合、QRコード。空文字の場合、空コンテナを返却する。)
   */
  Widget _createQrCode() {
    // 入力データが空でない場合
    if (_textController.text != ""){
      return QrImage(
        data: _data,
        version: QrVersions.auto,
        size: 200.0,
      );
      // 入力データが空の場合
    }else{
      return Container();
    };
  }

  /**
   * 画面を更新します。
   */
  void _refreshData(){
    // QRコードの再生成
    setState(() {
      _data = _textController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
