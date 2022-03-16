import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:weellu_web/app/constants/config.dart';
import 'package:weellu_web/app/data/models/file.dart';
import 'package:weellu_web/app/data/models/msg_model_list.dart';
import 'package:weellu_web/app/modules/widgets/chat_text_field.dart';
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
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width <= 500;
    return Scaffold(
      // floatingActionButton: CustomButton(
      //   onTap: () {},
      //   prefix: Icons.arrow_downward,
      // ),
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
            padding: isMobile
                ? EdgeInsets.zero
                : EdgeInsets.only(top: 50, left: 0, right: 25, bottom: 25),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pattern-01.png"),
                  repeat: ImageRepeat.repeat,
                  colorFilter: ColorFilter.mode(
                    Colors.orangeAccent.withAlpha(40),
                    BlendMode.color,
                  ),
                ),
                borderRadius: BorderRadius.circular(5),
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
                    padding:
                        EdgeInsets.fromLTRB(isMobile ? 10 : 35, 20, 30, 15),
                    decoration: BoxDecoration(
                      color: Config.colors.mainColor.withAlpha(200),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (isMobile)
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.arrow_back),
                          ),
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
                      controller: ScrollController(),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(40, 20, 30, 0),
                        child: Column(
                          children: [
                            MessageComponent(
                              message:
                                  "Em linguística, a noção de texto é ampla e ainda aberta a uma definição mais precisa. Grosso modo, pode ser entendido como manifestação linguística das ideias de um autor, que serão interpretadas pelo leitor de acordo com seus conhecimentos linguísticos e culturais. Seu tamanho é variável.",
                            ),
                            MessageComponent(
                              message: "Oi! Tudo bem?",
                            ),
                            MessageComponent(
                              message: "Tudo ótimo, e vc?",
                              isMe: true,
                            ),
                            MessageComponent(
                              message:
                                  "Você pode editar essas fotos e enviar novamente para mim? ",
                              file: MyFile(size: 41.36, name: " Fotos.zip"),
                              isMe: true,
                            ),
                            MessageComponent(
                              message: "Claro!",
                            ),
                            MessageComponent(
                              message: "Aqui estão as fotos editadas ",
                              file: MyFile(
                                  size: 65.36, name: " Fotos editadas.zip"),
                            ),
                            MessageComponent(
                              file: MyFile(
                                  size: 65.36, name: " Fotos editadas.zip"),
                            ),
                            CustomDivider(
                              date: "3 dias atrás",
                            ),
                            MessageComponent(
                              file: MyFile(
                                  size: 65.36, name: " Fotos editadas.zip"),
                              isMe: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: ChatTextField(
                      prefix: RBtn2(
                        icon: Icons.add,
                        onPressed: () {},
                      ),
                      suffix: RBtn2(
                        icon: FeatherIcons.send,
                        onPressed: () {},
                      ),
                      hintText: "Escreva uma mensagem...",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
