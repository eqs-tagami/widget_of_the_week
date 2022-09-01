import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 350,
      child: Stack(
        children: <Widget>[
          // 今回学ぶ対象のWidget
          AnimatedPositioned(
            // 選択状態によって横幅、高さ、位置を変更する
            width: selected ? 200.0 : 50.0,
            height: selected ? 50.0 : 200.0,
            top: selected ? 50.0 : 150.0,

            // 変更にかける時間
            duration: const Duration(seconds: 2),

            // 変更の加速度？？
            // curve: Curves.fastOutSlowIn,

            // バウンドしながら移動
            // curve: Curves.bounceIn,

            // 遅いから速い
            // curve: Curves.easeInExpo,

            // 少し速めから徐々に遅く
            curve: Curves.easeOutCirc,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
                color: Colors.blue,
                child: const Center(child: Text('Tap me')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
