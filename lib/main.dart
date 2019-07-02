import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/animation.dart';
import 'package:tutorial/dismissable_list.dart';
import 'package:tutorial/layout_demo.dart';
import 'package:tutorial/simple_redux.dart';
import 'package:tutorial/sliver_fun.dart';

// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Screens',
      home: ScreenList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScreenList extends StatelessWidget {
  ScreenList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Items"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Layout Demo"),
            subtitle: Text("A basic screen layout"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LayoutDemo()));
            },
          ),
          ListTile(
            title: Text("Simple Animation"),
            subtitle: Text("Animated Flutter Logo"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LogoApp()));
            },
          ),
          ListTile(
            title: Text("Sliversss"),
            subtitle: Text("Slivers allow custom scroll behavior"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SliverFun()));
            },
          ),
          ListTile(
            title: Text("Dismissable List"),
            subtitle: Text("Swipe to dimiss list elements."),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DismissableList()));
            },
          ),
          ListTile(
            title: Text("Simple Redux Example"),
            subtitle: Text("The most basic redux usage."),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FlutterReduxApp()));
            },
          )
        ],
      ),
    );
  }
}
