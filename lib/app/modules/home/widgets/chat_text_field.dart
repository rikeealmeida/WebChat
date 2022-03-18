import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:weellu_web/app/constants/config.dart';

import 'button.dart';

class ChatTextField extends StatefulWidget {
  final Function({String text}) sendMessage;
  final TextEditingController controller;
  final Widget prefix, suffix;
  final hintText;

  const ChatTextField(
      {Key key,
      this.prefix,
      this.suffix,
      this.hintText,
      this.controller,
      this.sendMessage})
      : super(key: key);

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  bool isEmpty = true;
  final controller = TextEditingController();
  FocusNode myFocusNode;

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

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    myFocusNode.dispose();
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
            // child: RawKeyboardListener(
            //   focusNode: FocusNode(),
            //   // ignore: void_checks
            //   onKey: (event) {
            //     if (event.isShiftPressed) {
            //       if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
            //         return false;
            //       }
            //     } else if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
            //       widget.sendMessage(text: controller.text);
            //       controller.clear();
            //       setState(() {
            //         isEmpty = true;
            //       });
            //     }
            //   },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                focusNode: myFocusNode,
                controller: controller,
                onChanged: (text) {
                  setState(() {
                    isEmpty = !text.isNotEmpty;
                  });
                },
                onSubmitted: (text) {
                  widget.sendMessage(text: controller.text);
                  setState(() {
                    isEmpty = true;
                  });
                  controller.clear();
                  myFocusNode.requestFocus();
                },
                maxLines: 1,
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
          if (widget.suffix != null) widget.suffix,
          RBtn(
              bgColor: Config.colors.appBarMainColor,
              color: Colors.white,
              icon: isEmpty ? FeatherIcons.mic : FeatherIcons.send,
              onPressed: isEmpty
                  ? () {}
                  : () {
                      widget.sendMessage(text: controller.text);
                      setState(() {
                        isEmpty = true;
                      });
                      controller.clear();
                      myFocusNode.requestFocus();
                    }),
        ],
      ),
    );
  }
}
