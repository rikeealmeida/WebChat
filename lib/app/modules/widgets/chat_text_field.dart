import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:weellu_web/app/constants/config.dart';

class ChatTextField extends StatefulWidget {
  final TextEditingController controller;
  final Widget prefix, suffix;
  final hintText;

  const ChatTextField(
      {Key key, this.prefix, this.suffix, this.hintText, this.controller})
      : super(key: key);

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Row(
      children: [
        if (widget.prefix != null) widget.prefix,
        Expanded(
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            // ignore: void_checks
            onKey: (event) {
              if (event.isShiftPressed) {
                if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
                  return false;
                }
              } else if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
                print(controller.text);
                setState(() {
                  controller.clear();
                });
              }
            },
            child: TextField(
              textInputAction: TextInputAction.go,
              controller: controller,
              maxLines: 4,
              minLines: 1,
              style: Config.styles.primaryTextStyle
                  .copyWith(color: Config.colors.textColorMenu),
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintStyle: Config.styles.primaryTextStyle.copyWith(
                  color: Config.colors.textColorMenu.withOpacity(.5),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(FeatherIcons.smile),
                ),
              ),
            ),
          ),
        ),
        if (widget.suffix != null) widget.suffix,
      ],
    );
  }
}
