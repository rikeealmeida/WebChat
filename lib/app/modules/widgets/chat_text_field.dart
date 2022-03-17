import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:weellu_web/app/constants/config.dart';

import 'button.dart';

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
  bool isEmpty = true;
  final controller = TextEditingController();
  @override
  void initState() {
    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        setState(() {
          isEmpty = false;
        });
      } else {
        setState(() {
          isEmpty = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 15),
      child: Row(
        children: [
          Row(
            children: [
              RBtn2(
                color: Config.colors.textColorMenu,
                icon: FeatherIcons.smile,
                onPressed: () {},
              ),
              SizedBox(
                width: 3,
              ),
              RBtn2(
                color: Config.colors.textColorMenu,
                icon: FeatherIcons.paperclip,
                onPressed: () {},
              ),
            ],
          ),
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
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
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
                      color: Config.colors.textColorMenu.withOpacity(.8),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (widget.suffix != null) widget.suffix,
          RBtn(
            bgColor: Config.colors.appBarMainColor,
            color: Colors.white,
            icon: isEmpty ? FeatherIcons.mic : FeatherIcons.send,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
