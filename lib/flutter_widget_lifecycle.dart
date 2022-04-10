import 'package:flutter/material.dart';

class WidgetLifeCycle extends StatefulWidget {
  const WidgetLifeCycle({Key? key}) : super(key: key);

  ///当我们构建一个新的StatefulWidget时, 这个会立即调用
  ///并且这个方法必须被覆盖
  @override
  State<WidgetLifeCycle> createState() => _WidgetLifeCycleState();
}

class _WidgetLifeCycleState extends State<WidgetLifeCycle> {
  int _count = 0;

  ///这是创建widget时调用的除构造方法外的第一个方法:
  ///类似于Android的: onCreate() 与 IOS的 viewDidLoad()
  ///在这个方法中通常会做一些初始化工作，比如channel的初始化，监听器的初始化等
  @override
  void initState() {
    print('----initState----');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('----didChangeDependencies----');
    super.didChangeDependencies();
  }

  /// 必须实现的方法，在这里实现你要呈现的页面内容
  /// 会在didChangeDependencies()之后立即调用
  @override
  Widget build(BuildContext context) {
    print('----build----');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter页面生命周期'),
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              child: Text(
                '点我',
                style: TextStyle(fontSize: 26),
              ),
            ),
            Text(_count.toString())
          ],
        ),
      ),
    );
  }

  ///当父组件需要重写绘制时才会调用
  @override
  void didUpdateWidget(WidgetLifeCycle oldWidget) {
    print('----didUpdateWidget----');
    super.didUpdateWidget(oldWidget);
  }

  ///很少使用，销毁期
  @override
  void deactivate() {
    print('----deactivate----');
    super.deactivate();
  }

  ///常用，组件被销毁时候调用
  @override
  void dispose() {
    print('----dispose----');
    super.dispose();
  }
}
