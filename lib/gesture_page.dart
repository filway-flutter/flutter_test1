import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  const GesturePage({Key? key}) : super(key: key);

  @override
  State<GesturePage> createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String pringString = '';
  double moveX = 0, moveY = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.green,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何检测用户手势以及处理点击事件？'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () => {_printMsg('点击')},
                    onDoubleTap: () => {_printMsg('双击')},
                    onLongPress: () => {_printMsg('长按')},
                    onTapCancel: () => {_printMsg('取消')},
                    onTapUp: (e) => {_printMsg('松开')},
                    onTapDown: (e) => {_printMsg('按下')},
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                      ),
                      child: Text(
                        '点我',
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    ),
                  ),
                  Text(pringString)
                ],
              ),
              Positioned(
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: (e) => _doMove(e),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(36),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _printMsg(String s) {
    setState(() {
      pringString += ' ,${s}';
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveY += e.delta.dy;
      moveX += e.delta.dx;
    });
    print(e);
  }
}
