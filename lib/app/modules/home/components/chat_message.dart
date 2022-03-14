import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:weellu_web/app/constants/config.dart';
import 'package:weellu_web/app/data/models/msg_model_list.dart';
import 'package:weellu_web/app/modules/widgets/message_component.dart';

import '../../widgets/button.dart';
import '../../widgets/item_profile.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage({Key key}) : super(key: key);

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Config.colors.bodyBackgroundColor.withOpacity(0.5),
              Config.colors.mainColor.withOpacity(0.5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, .5],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 50, left: 0, right: 25, bottom: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Config.colors.textColorMenu.withOpacity(.2),
                    blurRadius: 5,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(35, 20, 30, 15),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Config.colors.dividerColor,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemProfile(
                          msg: MessageModelList(
                              statusMessage: "Visto por último 5 horas atrás",
                              username: 'Henrique Almeida',
                              time: "1 minuto atrás",
                              profile_asset: Config.assets.user1,
                              type: MessageType.LAST_AGO),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        RBtn(
                          icon: FeatherIcons.paperclip,
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        RBtn(
                          icon: FeatherIcons.moreVertical,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(40, 20, 30, 0),
                      child: Column(
                        children: [
                          MessageComponent(
                            message:
                                "Em linguística, a noção de texto é ampla e ainda aberta a uma definição mais precisa. Grosso modo, pode ser entendido como manifestação linguística das ideias de um autor, que serão interpretadas pelo leitor de acordo com seus conhecimentos linguísticos e culturais. Seu tamanho é variável.",
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
