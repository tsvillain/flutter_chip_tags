import 'package:flutter/material.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clip Tag Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Clip Tags Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //initialize an empty list
  List<String> _myList = List<String>();
  List<String> _myListCustom = List<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Default
            ChipTags(
              list: _myList,
            ),
            Divider(),
            //Customised
            ChipTags(
              list: _myListCustom,
              chipColor: Colors.black,
              iconColor: Colors.white,
              textColor: Colors.white,
              decoration: InputDecoration(hintText: "Your Custom Hint"),
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}
