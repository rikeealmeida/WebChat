import 'package:flutter/material.dart';
import 'package:weellu_web/app/constants/config.dart';
import 'package:weellu_web/app/modules/home/components/svg_icon.dart';

import '../../../data/models/msg_model_list.dart';

class ItemProfile extends StatelessWidget {
  const ItemProfile({Key key, this.msgModel}) : super(key: key);
  final MessageModelList msgModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(msgModel.profile_asset),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (msgModel.statusMessage != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (msgModel.status != null &&
                        msgModel.status != StatusType.LAST_AGO) ...[
                      SvgIcon(
                        size: msgModel.status == StatusType.WRITE ? 4 : 10,
                        color: msgModel.isSelected
                            ? Colors.white
                            : Config.colors.primaryColor,
                        asset: msgModel.status == StatusType.RECORD
                            ? Config.assets.record
                            : Config.assets.write,
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                    Text(
                      msgModel.statusMessage,
                      style: Config.styles.primaryTextStyle.copyWith(
                          color: msgModel.isSelected
                              ? Colors.white
                              : Config.colors.primaryBlackColor,
                          fontSize: 11),
                    )
                  ],
                )
            ],
          ),
        ),
      ],
    );
  }
}
