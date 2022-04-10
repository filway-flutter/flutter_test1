import 'package:flutter/material.dart';

class AnimationApp extends StatefulWidget {
  const AnimationApp({Key? key}) : super(key: key);

  @override
  State<AnimationApp> createState() => _AnimationAppState();
}

class _AnimationAppState extends State<AnimationApp>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;
  AnimationStatus? animationStatus;
  double? animationValue;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );
    animation = Tween<double>(begin: 0, end: 300).animate(controller!)
      ..addListener(() {
        setState(() {
          animationValue = animation?.value;
        });
      })
      ..addStatusListener((AnimationStatus state) {
        setState(() {
          animationStatus = state;
        });
      });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动画01'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        alignment: Alignment.center,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                controller?.reset();
                controller?.forward();
              },
              child: Text(
                'Start',
                textDirection: TextDirection.ltr,
              ),
            ),
            Text(
              'State: ' + animationStatus.toString(),
              textDirection: TextDirection.ltr,
            ),
            Text(
              'Value: ' + animationValue.toString(),
              textDirection: TextDirection.ltr,
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              height: animation?.value,
              width: animation?.value,
              child: FlutterLogo(),
            )
          ],
        ),
      ),
    );
  }
}
