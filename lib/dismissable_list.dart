import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// MyApp is a StatefulWidget. This allows updating the state of the
// widget when an item is removed.
class DismissableList extends StatefulWidget {
  DismissableList({Key key}) : super(key: key);

  @override
  DismissableListState createState() {
    return DismissableListState();
  }
}

class DismissableListState extends State<DismissableList> {
  final items = List<String>.generate(3, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.

              key: Key(item),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                print(direction);
                if (direction == DismissDirection.startToEnd) {
                  // Remove the item from the data source.
                  var removed = items.elementAt(index);
                  setState(() {
                    items.removeAt(index);
                  });

                  // Then show a snackbar.
                  Scaffold.of(context).showSnackBar(SnackBar(
                    action: SnackBarAction(
                      label: "UNDO",
                      textColor: Colors.red,
                      onPressed: () {
                        setState(() {
                          items.insert(index, removed);
                        });
                      },
                    ),
                    content: Text("$item deleted"),
                  ));
                } else if (direction == DismissDirection.endToStart) {
                  print("LIKED");
                }
              },
              // Show a red background as the item is swiped away.
              background: Container(
                color: Colors.red,
                child: Icon(Icons.delete_forever),
              ),
              secondaryBackground: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.green,
                  child: Icon(Icons.favorite)),
              child: ListTile(title: Text('$item')),
            );
          },
        ),
      ),
    );
  }
}
