library flutter_chip_tags;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChipTags extends StatefulWidget {
  final Color iconColor;
  final Color chipColor;
  final Color textColor;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final List<String> list;
  const ChipTags(
      {Key key,
      this.iconColor,
      this.chipColor,
      this.textColor,
      this.decoration,
      this.keyboardType,
      @required this.list})
      : super(key: key);
  @override
  _ChipTagsState createState() => _ChipTagsState();
}

class _ChipTagsState extends State<ChipTags>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Form(
          key: _formKey,
          child: TextFormField(
            decoration: widget.decoration ??
                InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Separate Tags with Space",
                ),
            keyboardType: widget.keyboardType ?? TextInputType.text,
            onChanged: (value) {
              if (value.endsWith(" ")) {
                widget.list.add(value);
                _formKey.currentState.reset();
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
                    backgroundColor: widget.chipColor ?? Colors.blue,
                    label: Text(
                      widget.list[index],
                      style: TextStyle(color: widget.textColor ?? Colors.white),
                    ),
                    avatar: Icon(Icons.remove_circle_outline,
                        color: widget.iconColor ?? Colors.white),
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
