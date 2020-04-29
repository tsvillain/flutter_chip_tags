library flutterchiptags;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterChipTags extends StatefulWidget {
  final Color iconColor;
  final Color chipColor;
  final Color textColor;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final GlobalKey<FormState> formKey;
  final List<String> list;
  const FlutterChipTags({@required Key key, this.iconColor, this.chipColor, this.textColor,this.decoration, this.keyboardType , @required this.list, @required this.formKey}) : super (key: key);
  @override
  _FlutterChipTagsState createState() => _FlutterChipTagsState();
}

class _FlutterChipTagsState extends State<FlutterChipTags> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Form(
          key: widget.key,
          child: TextFormField(
            decoration: widget.decoration,
            keyboardType: widget.keyboardType,
            onChanged: (value){
              if(value.endsWith(" ")){
                widget.list.add(value);
                widget.formKey.currentState.reset();
                setState(() {});
              }
            },
          ),
        ),
        Container(
          height: 50,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilterChip(
                    backgroundColor: widget.iconColor,
                    label: Text(
                      widget.list[index],
                      style: TextStyle(color: widget.textColor),
                    ),
                    avatar: Icon(Icons.remove_circle_outline,
                        color: widget.iconColor),
                    onSelected: (value) {
                      widget.list.removeAt(index);
                      setState(() {});
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}

