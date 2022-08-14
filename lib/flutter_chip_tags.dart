library flutter_chip_tags;

import 'package:flutter/material.dart';
import 'package:flutter_chip_tags/src/core/util/enum.dart';

export './src/core/util/enum.dart';

class ChipTags extends StatefulWidget {
  const ChipTags({
    Key? key,
    this.iconColor,
    this.chipColor,
    this.textColor,
    this.decoration,
    this.keyboardType,
    this.separator,
    this.createTagOnSubmit = false,
    this.chipPosition = ChipPosition.below,
    required this.list,
  }) : super(key: key);

  ///sets the remove icon Color
  final Color? iconColor;

  ///sets the chip background color
  final Color? chipColor;

  ///sets the color of text inside chip
  final Color? textColor;

  ///container decoration
  final InputDecoration? decoration;

  ///set keyboradType
  final TextInputType? keyboardType;

  ///customer symbol to seprate tags by default
  ///it is " " space.
  final String? separator;

  /// list of String to display
  final List<String> list;

  final ChipPosition chipPosition;

  /// Default `createTagOnSumit = false`
  /// Creates new tag if user submit.
  /// If true they separtor will be ignored.
  final bool createTagOnSubmit;

  @override
  _ChipTagsState createState() => _ChipTagsState();
}

class _ChipTagsState extends State<ChipTags>
    with SingleTickerProviderStateMixin {
  FocusNode _focusNode = FocusNode();

  ///Form key for TextField
  final _formKey = GlobalKey<FormState>();
  TextEditingController _inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Visibility(
            visible: widget.chipPosition == ChipPosition.above,
            child: _chipListPreview()),
        Form(
          key: _formKey,
          child: TextField(
            controller: _inputController,
            decoration: widget.decoration ??
                InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: widget.createTagOnSubmit
                      ? "Submit text to create Tags"
                      : "Separate Tags with '${widget.separator ?? 'space'}'",
                ),
            keyboardType: widget.keyboardType ?? TextInputType.text,
            textInputAction: TextInputAction.done,
            focusNode: _focusNode,
            onSubmitted: widget.createTagOnSubmit
                ? (value) {
                    widget.list.add(value);

                    ///setting the controller to empty
                    _inputController.clear();

                    ///resetting form
                    _formKey.currentState!.reset();

                    ///refersing the state to show new data
                    setState(() {});
                    _focusNode.requestFocus();
                  }
                : null,
            onChanged: widget.createTagOnSubmit
                ? null
                : (value) {
                    ///check if user has send separator so that it can break the line
                    ///and add that word to list
                    if (value.endsWith(widget.separator ?? " ")) {
                      ///check for ' ' and duplicate tags
                      if (value != widget.separator &&
                          !widget.list.contains(value.trim())) {
                        widget.list.add(value
                            .replaceFirst(widget.separator ?? " ", '')
                            .trim());
                      }

                      ///setting the controller to empty
                      _inputController.clear();

                      ///resetting form
                      _formKey.currentState!.reset();

                      ///refersing the state to show new data
                      setState(() {});
                    }
                  },
          ),
        ),
        Visibility(
            visible: widget.chipPosition == ChipPosition.below,
            child: _chipListPreview()),
      ],
    );
  }

  Visibility _chipListPreview() {
    return Visibility(
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
                    style: TextStyle(color: widget.textColor ?? Colors.white),
                  ),
                  avatar: Icon(Icons.remove_circle_outline,
                      color: widget.iconColor ?? Colors.white),
                  onSelected: (value) {
                    widget.list.remove(text);
                    setState(() {});
                  }));
        }).toList(),
      ),
    );
  }
}
