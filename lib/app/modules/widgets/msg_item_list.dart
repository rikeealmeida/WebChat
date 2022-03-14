import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:weellu_web/app/constants/config.dart';
import 'package:weellu_web/app/data/models/msg_model_list.dart';
import 'package:weellu_web/app/modules/widgets/item_profile.dart';

class MessageItemList extends StatefulWidget {
  final MessageModelList msg;

  const MessageItemList({Key key, this.msg}) : super(key: key);

  @override
  State<MessageItemList> createState() => _MessageItemListState();
}

class _MessageItemListState extends State<MessageItemList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.msg.notif = null;
          widget.msg.isSelected = !widget.msg.isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                color: widget.msg.isSelected
                    ? Config.colors.appBarMainColor
                    : Config.colors.mainColor.withOpacity(0.5)),
            color: Colors.white,
            gradient: widget.msg.isSelected
                ? LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: const [
                        0.02,
                        0,
                        0
                      ],
                    colors: [
                        Config.colors.appBarMainColor,
                        Colors.white,
                        Colors.white,
                      ])
                : null,
            boxShadow: [
              BoxShadow(
                  color: Config.colors.textColorMenu.withOpacity(.7),
                  offset: const Offset(0, 0),
                  blurRadius: 0),
            ]),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemProfile(
                  msg: widget.msg,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.msg.time,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: Config.styles.primaryTextStyle.copyWith(
                          fontSize: 12, color: Config.colors.textColorMenu),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    if (widget.msg.notif != null)
                      Container(
                        margin: const EdgeInsets.only(left: 6),
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 4, top: 5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                        child: Text(
                          "${widget.msg.notif}",
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white),
                        ),
                      ),
                    if (widget.msg.notif == null)
                      Container(
                        width: 20,
                      )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemFile extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;

  const ItemFile({Key key, this.title, this.color, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Config.colors.primaryColor.withOpacity(.25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            FeatherIcons.file,
            size: 13,
            color: Config.colors.primaryColor,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "$title",
            style: Config.styles.primaryTextStyle
                .copyWith(color: Config.colors.primaryColor, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
