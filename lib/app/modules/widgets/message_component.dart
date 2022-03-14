import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:weellu_web/app/constants/config.dart';
import 'package:weellu_web/app/data/models/file.dart';

class MessageComponent extends StatelessWidget {
  final bool isMe;
  final String message;
  final MyFile file;

  const MessageComponent({Key key, this.isMe = false, this.message, this.file})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        children: [
          if (!isMe)
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(Config.assets.user1),
            ),
          Row(
            children: [
              if (isMe)
                Icon(
                  FeatherIcons.moreHorizontal,
                  size: 18,
                  color: Config.colors.textColorMenu,
                ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: width / 4,
                ),
                decoration: BoxDecoration(
                  color: isMe ? Colors.white : Config.colors.mainColor,
                  boxShadow: [
                    if (!isMe) ...[
                      BoxShadow(
                          color:
                              Config.colors.shadowButtonColor.withOpacity(.15),
                          offset: Offset(6, 6),
                          blurRadius: 10),
                      BoxShadow(
                          color:
                              Config.colors.shadowButtonColor.withOpacity(.15),
                          offset: Offset(6, 6),
                          blurRadius: 10),
                      BoxShadow(
                          color:
                              Config.colors.shadowButtonColor.withOpacity(.15),
                          offset: Offset(6, 6),
                          blurRadius: 10)
                    ] else ...[
                      BoxShadow(
                          color: Config.colors.shadowCurrentUserChat
                              .withOpacity(.15),
                          offset: Offset(6, 6),
                          blurRadius: 10),
                      BoxShadow(
                          color: Config.colors.shadowCurrentUserChat
                              .withOpacity(.15),
                          offset: Offset(6, 6),
                          blurRadius: 10),
                      BoxShadow(
                          color: Config.colors.shadowCurrentUserChat
                              .withOpacity(.15),
                          offset: Offset(6, 6),
                          blurRadius: 10),
                    ],
                  ],
                  gradient: isMe
                      ? null
                      : LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.bottomLeft,
                          colors: [
                              Config.colors.mainColor,
                              Config.colors.mainColor,
                              Config.colors.mainColor,
                            ]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(10),
                      bottomRight: const Radius.circular(10),
                      topRight: isMe
                          ? const Radius.circular(0)
                          : const Radius.circular(10),
                      topLeft: isMe
                          ? const Radius.circular(10)
                          : const Radius.circular(0)),
                ),
                child: Column(
                  crossAxisAlignment:
                      !isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                  children: [
                    if (message != null) ...[
                      Text(
                        message,
                        style: Config.styles.primaryTextStyle.copyWith(
                            color: isMe
                                ? Config.colors.textColorMenu
                                : Colors.white,
                            fontSize: 13),
                      ),
                      if (file != null) ...[
                        const SizedBox(
                          height: 10,
                        ),
                        FileWidget(
                          file: file,
                          isMe: isMe,
                        ),
                      ]
                    ] else ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white.withOpacity(.5),
                            ),
                            child: const Icon(
                              FeatherIcons.file,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                file.name,
                                style: Config.styles.primaryTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: !isMe
                                        ? Colors.white
                                        : Config.colors.textColorMenu),
                              ),
                              Text(
                                "${file.size} Mb",
                                style: Config.styles.primaryTextStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: !isMe
                                        ? Colors.white
                                        : Config.colors.textColorMenu),
                              )
                            ],
                          )
                        ],
                      )
                    ]
                  ],
                ),
              ),
              if (isMe) ...[
                Icon(
                  FeatherIcons.moreHorizontal,
                  color: Config.colors.textColorMenu,
                  size: 18,
                ),
              ] else ...[
                FullCheck()
              ]
            ],
          ),
        ],
      ),
    );
  }
}

class FullCheck extends StatelessWidget {
  final double size;
  final bool isChecked;
  final Color checkColor1, checkColor2;
  const FullCheck(
      {Key key,
      this.size = 15,
      this.isChecked = false,
      this.checkColor1,
      this.checkColor2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          FeatherIcons.check,
          size: size,
          color: checkColor1 ?? Config.colors.checkColor,
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Icon(
            FeatherIcons.check,
            size: size,
            color: checkColor2 ?? Config.colors.checkColor,
          ),
        )
      ],
    );
  }
}

class FileWidget extends StatelessWidget {
  final MyFile file;
  final bool isMe;
  const FileWidget({Key key, this.file, this.isMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (isMe)
          Icon(
            FeatherIcons.file,
            size: 13,
            color: !isMe ? Colors.white : Config.colors.mainColor,
          ),
        Expanded(
          flex: 2,
          child: Text(
            "(${file.size} Mb)${file.name}",
            textAlign: isMe ? TextAlign.start : TextAlign.end,
            overflow: TextOverflow.ellipsis,
            style: Config.styles.primaryTextStyle.copyWith(
                fontSize: 12,
                color: !isMe ? Colors.white : Config.colors.mainColor),
          ),
        ),
        if (isMe)
          Icon(
            FeatherIcons.file,
            size: 13,
            color: isMe ? Colors.white : Config.colors.mainColor,
          ),
      ],
    );
  }
}
