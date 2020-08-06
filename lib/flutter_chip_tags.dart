library flutter_chip_tags;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChipTags extends StatefulWidget {
  ///sets the remove icon Color
  final Color iconColor;

  ///sets the chip background color
  final Color chipColor;

  ///sets the color of text inside chip
  final Color textColor;

  ///container decoration
  final InputDecoration decoration;

  ///set keyboradType
  final TextInputType keyboardType;

  /// list of String to display
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
  ///Form key for TextField
  final _formKey = GlobalKey<FormState>();
  TextEditingController _inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Form(
          key: _formKey,
          child: TextField(
            controller: _inputController,
            decoration: widget.decoration ??
                InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Separate Tags with Space",
                ),
            keyboardType: widget.keyboardType ?? TextInputType.text,
            onChanged: (value) {
              ///check if user has send " " so that it can break the line
              ///and add that word to list
              if (value.endsWith(" ")) {
                 if (value != ' ' && !widget.list.contains(value.trim())) {
                  widget.list.add(value.trim());
                }

                ///setting the controller to empty
                _inputController.clear();

                ///resetting form
                _formKey.currentState.reset();

                ///refersing the state to show new data
                setState(() {});
              }
            },
          ),
        ),
        Visibility(
          //if length is 0 it will not occupie any space
          visible: widget.list.length > 0,
          child: Wrap(
            ///creating a list
            children: widget.list.map((text) {
              return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FilterChip(
                      backgroundColor: widget.chipColor ?? Colors.blue,
                      label: Text(
                        text,
                        style:
                            TextStyle(color: widget.textColor ?? Colors.white),
                      ),
                      avatar: Icon(Icons.remove_circle_outline,
                          color: widget.iconColor ?? Colors.white),
                      onSelected: (value) {
                        widget.list.remove(text);
                        setState(() {});
                      }));
            }).toList(),
          ),
        ),
      ],
    );
  }
}
