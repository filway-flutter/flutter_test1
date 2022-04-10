import 'package:flutter/material.dart';
import 'package:flutter_test1/app_lifecycle.dart';
import 'package:flutter_test1/flutter_layout_page.dart';
import 'package:flutter_test1/flutter_widget_lifecycle.dart';
import 'package:flutter_test1/gesture_page.dart';
import 'package:flutter_test1/launch_page.dart';
import 'package:flutter_test1/less_group_page.dart';
import 'package:flutter_test1/plugin_use.dart';
import 'package:flutter_test1/res_page.dart';
import 'package:flutter_test1/statefull_group_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('如何创建和使用Flutter的路由与导航?')),
        body: const RouteNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        'plugin': (BuildContext context) => PluginUse(),
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StateFullGroupPage(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'gesture': (BuildContext context) => GesturePage(),
        'res_page': (BuildContext context) => ResPage(),
        'launch': (BuildContext context) => LaunchPage(),
        'lifecycle': (BuildContext context) => WidgetLifeCycle(),
        'app_lifecycle': (BuildContext context) => AppLifecycle(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  const RouteNavigator({Key? key}) : super(key: key);

  @override
  State<RouteNavigator> createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SwitchListTile(
              title: Text('${byName ? '' : '不'}通过路由名跳转'),
              value: byName,
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('如何使用Flutter包和插件?', PluginUse(), 'plugin'),
          _item('StatelessWidget与基础组件', LessGroupPage(), 'less'),
          _item('StatefulWidget与基础组件', StateFullGroupPage(), 'ful'),
          _item('如何进行Flutter布局开发', FlutterLayoutPage(), 'layout'),
          _item('如何检测用户手势以及处理点击事件?', GesturePage(), 'gesture'),
          _item('如何导入和使用Flutter的资源文件?', ResPage(), 'res_page'),
          _item('如何打开第三方应用?', LaunchPage(), 'launch'),
          _item('页面生命周期', WidgetLifeCycle(), 'lifecycle'),
          _item('应用生命周期', AppLifecycle(), 'app_lifecycle'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          }
        },
        child: Text(title),
      ),
    );
  }
}
