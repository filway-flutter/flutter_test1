import 'package:flutter/material.dart';
import 'package:flutter_test1/animation.dart';
import 'package:flutter_test1/app_lifecycle.dart';
import 'package:flutter_test1/flutter_layout_page.dart';
import 'package:flutter_test1/flutter_widget_lifecycle.dart';
import 'package:flutter_test1/gesture_page.dart';
import 'package:flutter_test1/launch_page.dart';
import 'package:flutter_test1/less_group_page.dart';
import 'package:flutter_test1/photo_app.dart';
import 'package:flutter_test1/plugin_use.dart';
import 'package:flutter_test1/res_page.dart';
import 'package:flutter_test1/statefull_group_page.dart';

void main() {
  runApp(const DynamicTheme());
}

class DynamicTheme extends StatefulWidget {
  const DynamicTheme({Key? key}) : super(key: key);

  @override
  State<DynamicTheme> createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //fontFamily: 'Crimson', // 全局字体
        primarySwatch: Colors.blue,
        brightness: _brightness,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text('如何创建和使用Flutter的路由与导航?')),
          body: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_brightness == Brightness.dark) {
                      _brightness = Brightness.light;
                    } else {
                      _brightness = Brightness.dark;
                    }
                  });
                },
                child: Text(
                  '切换主题abc',
                  style: TextStyle(fontFamily: 'Career'),
                ),
              ),
              const RouteNavigator(),
            ],
          )),
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
        'photo': (BuildContext context) => PhotoApp(),
        'animation_01': (BuildContext context) => AnimationApp(),
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
          _item('Flutter应用生命周期', AppLifecycle(), 'app_lifecycle'),
          _item('【实战尝鲜】拍照APP开发', PhotoApp(), 'photo'),
          _item('动画01', AnimationApp(), 'animation_01'),
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
