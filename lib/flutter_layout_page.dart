import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterLayoutPage());
}

class FlutterLayoutPage extends StatefulWidget {
  const FlutterLayoutPage({Key? key}) : super(key: key);

  @override
  State<FlutterLayoutPage> createState() => _FlutterLayoutPageState();
}

///如何进行Flutter布局开发
class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: '如何进行Flutter布局开发',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何进行Flutter布局开发'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.list,
                color: Colors.blue,
              ),
              label: '列表',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              ClipOval(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(
                                    'https://pic.rmb.bdstatic.com/1530971282b420d77bdfb6444d854f952fe31f0d1e.jpeg',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Opacity(
                                    opacity: 0.6,
                                    child: Image.network(
                                      'https://pic.rmb.bdstatic.com/1530971282b420d77bdfb6444d854f952fe31f0d1e.jpeg',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              hintText: '请输入',
                              hintStyle: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            child: PhysicalModel(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                              clipBehavior: Clip.antiAlias, //抗锯齿
                              child: PageView(
                                children: [
                                  _item('Page1', Colors.deepPurple),
                                  _item('Page2', Colors.green),
                                  _item('Page3', Colors.red),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                  ),
                                  child: Text('宽度撑满'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Image.network(
                          'https://pic.rmb.bdstatic.com/1530971282b420d77bdfb6444d854f952fe31f0d1e.jpeg',
                          width: 100,
                          height: 100,
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image.network(
                            'https://pic.rmb.bdstatic.com/1530971282b420d77bdfb6444d854f952fe31f0d1e.jpeg',
                            width: 36,
                            height: 36,
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        _chip('Flutter'),
                        _chip('进阶'),
                        _chip('实战'),
                        _chip('携程'),
                        _chip('App'),
                      ],
                    )
                  ],
                ),
                onRefresh: _handleRefresh,
              )
            : Column(
                children: [
                  Text('列表页面'),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text(
                        '拉伸填满高度',
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Future _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _item(String title, MaterialColor color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}