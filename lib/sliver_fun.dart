import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class SliverFun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          title: Text('SliverAppBar'),
          backgroundColor: Colors.blue,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset('assets/alps.jpg', fit: BoxFit.cover),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              // To convert this infinite list to a list with three items,
              // uncomment the following line:
              // if (index > 3) return null;
              return Container(color: RandomColor().randomColor(),  height: 150.0);
            },
            // Or, uncomment the following line:
            // childCount: 3,
          ),
        )
      ],
    );
  }
}
