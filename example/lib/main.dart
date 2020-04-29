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
  final _formKey = GlobalKey<FormState>();
  //initialize an empty list
  List<String> _myList = List<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FlutterChipTags(
        key: _formKey,
        list: _myList,
        keyboardType: TextInputType.text,
        chipColor: Colors.blue,
        iconColor: Colors.red,
        textColor: Colors.white,
        decoration: InputDecoration(
          hintText: "Hello",
        ),
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
