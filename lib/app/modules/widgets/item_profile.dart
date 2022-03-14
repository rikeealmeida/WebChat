import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:weellu_web/app/constants/config.dart';
import 'package:weellu_web/app/modules/widgets/svg_icon.dart';
import '../../data/models/msg_model_list.dart';

class ItemProfile extends StatelessWidget {
  const ItemProfile({Key key, this.msg}) : super(key: key);
  final MessageModelList msg;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          maxRadius: 30,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(msg.profile_asset),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              msg.username,
              style: Config.styles.primaryTextStyle
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              msg.statusMessage,
              style: Config.styles.primaryTextStyle
                  .copyWith(fontSize: 10, color: Config.colors.textColorMenu),
            ),
            const SizedBox(
              height: 10,
            ),
            if (msg.messageContent != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (msg.status != null &&
                      msg.status != MessageStatus.RECEIVED) ...[
                    msg.status == MessageStatus.SEND
                        ? const Icon(
                            Icons.done,
                            color: Colors.yellow,
                            size: 10,
                          )
                        : msg.status == MessageStatus.READ
                            ? const Icon(
                                Icons.done_all,
                                color: Colors.green,
                                size: 10,
                              )
                            : msg.status == MessageStatus.UNREAD
                                ? const Icon(
                                    Icons.done_all,
                                    color: Colors.yellow,
                                    size: 10,
                                  )
                                : const Icon(
                                    FeatherIcons.clock,
                                    color: Colors.red,
                                    size: 10,
                                  ),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                  if (msg.type != null && msg.type != MessageType.LAST_AGO) ...[
                    msg.type == MessageType.RECORD
                        ? Icon(
                            FeatherIcons.mic,
                            color: msg.status != MessageStatus.READ
                                ? Colors.yellow
                                : Colors.green,
                            size: 10,
                          )
                        : msg.type == MessageType.WRITE
                            ? SvgIcon(
                                size: 4,
                                color: msg.status != MessageStatus.READ
                                    ? Colors.yellow
                                    : Colors.green,
                                asset: Config.assets.write,
                              )
                            : msg.type == MessageType.PHOTO
                                ? Icon(
                                    FeatherIcons.image,
                                    color: msg.status != MessageStatus.READ
                                        ? Colors.yellow
                                        : Colors.green,
                                    size: 10,
                                  )
                                : msg.type == MessageType.VIDEO
                                    ? Icon(
                                        FeatherIcons.video,
                                        color: msg.status != MessageStatus.READ
                                            ? Colors.yellow
                                            : Colors.green,
                                        size: 10,
                                      )
                                    : Icon(
                                        FeatherIcons.file,
                                        color: msg.status != MessageStatus.READ
                                            ? Colors.yellow
                                            : Colors.green,
                                        size: 10,
                                      ),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .10,
                    child: Text(
                      msg.messageContent,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Config.styles.primaryTextStyle.copyWith(
                          color: Config.colors.primaryBlackColor, fontSize: 11),
                    ),
                  ),
                ],
              )
          ],
        ),
      ],
    );
  }
}
