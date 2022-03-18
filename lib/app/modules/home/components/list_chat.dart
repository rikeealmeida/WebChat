import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:weellu_web/app/constants/config.dart';
import 'package:weellu_web/app/data/models/msg_model_list.dart';
import 'package:weellu_web/app/modules/home/widgets/button.dart';
import 'package:weellu_web/app/modules/home/widgets/cdropdown.dart';
import 'package:weellu_web/app/modules/home/widgets/csearch.dart';
import 'package:weellu_web/app/modules/home/widgets/msg_item_list.dart';
import 'package:weellu_web/app/modules/home/widgets/search_box.dart';

class ListChat extends StatefulWidget {
  const ListChat({Key key, this.onOpenMenu}) : super(key: key);
  final Function onOpenMenu;

  @override
  State<ListChat> createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  String recentValue = "Recentes";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
          children: [
            Container(
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
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 25, right: 25,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mensagens",
                        style: Config.styles.primaryTextStyle.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 35),
                            child: CustomDropDown(
                              items: const ["Recentes", "Antigas"],
                              onChanged: (e) {
                                recentValue = e;
                                setState(() {});
                              },
                              value: recentValue,
                            ),
                          ),
                          Container(
                            child: SearchBox(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          MessageItemList(
                            msg: MessageModelList(
                              status: MessageStatus.SEND,
                              isSelected: true,
                              username: 'Henrique Almeida',
                              statusMessage: "Visto por último 1 minuto atrás",
                              messageContent:
                                  "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.",
                              time: "1 minuto atrás",
                              profile_asset: Config.assets.user1,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          MessageItemList(
                            msg: MessageModelList(
                              type: MessageType.RECORD,
                              status: MessageStatus.READ,
                              isVoice: true,
                              notif: 2,
                              username: 'Fulano',
                              statusMessage: "Visto por último 5 minutos atrás",
                              messageContent: "Mensagem de voz (01:15)",
                              time: "3 dias atrás",
                              profile_asset: Config.assets.user2,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          MessageItemList(
                            msg: MessageModelList(
                              status: MessageStatus.SEND,
                              notif: 5,
                              type: MessageType.VIDEO,
                              username: 'Fulano 2',
                              statusMessage: "Gravando mensagem de voz...",
                              messageContent: "Video",
                              time: "1 dia atrás",
                              profile_asset: Config.assets.user4,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          MessageItemList(
                            msg: MessageModelList(
                              status: MessageStatus.UNREAD,
                              notif: 5,
                              type: MessageType.PHOTO,
                              username: 'Fulano 3',
                              statusMessage: "Visto por último 5 horas atrás",
                              messageContent: "Imagem",
                              time: "1 dia atrás",
                              profile_asset: Config.assets.user3,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          MessageItemList(
                            msg: MessageModelList(
                              notif: 5,
                              type: MessageType.FILE,
                              username: 'Fulano 4',
                              statusMessage: "Visto por último 5 horas atrás",
                              messageContent: "Arquivo",
                              time: "1 dia atrás",
                              profile_asset: Config.assets.user,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          MessageItemList(
                            msg: MessageModelList(
                              status: MessageStatus.SEND,
                              username: 'Fulano 5',
                              statusMessage: "Visto por último 5 horas atrás",
                              messageContent: "Oi!",
                              time: "1 dia atrás",
                              profile_asset: Config.assets.user4,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          MessageItemList(
                            msg: MessageModelList(
                              status: MessageStatus.READ,
                              username: 'Fulano 6',
                              statusMessage: "Visto por último 5 horas atrás",
                              messageContent: "Tudo bem?",
                              time: "1 dia atrás",
                              profile_asset: Config.assets.user,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          MessageItemList(
                            msg: MessageModelList(
                              status: MessageStatus.UNREAD,
                              username: 'Fulano 7',
                              statusMessage: "Digitando...",
                              messageContent: "Como vc tá?",
                              time: "1 dia atrás",
                              profile_asset: Config.assets.user1,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          MessageItemList(
                            msg: MessageModelList(
                              status: MessageStatus.UNSEND,
                              username: 'Fulano 8',
                              statusMessage: "Visto por último 3 dias atrás",
                              messageContent:
                                  "Em linguística, a noção de texto é ampla e ainda aberta a uma definição mais precisa. Grosso modo, pode ser entendido como manifestação linguística das ideias de um autor, que serão interpretadas pelo leitor de acordo com seus conhecimentos linguísticos e culturais. Seu tamanho é variável.",
                              time: "1 dia atrás",
                              profile_asset: Config.assets.user3,
                            ),
                          ),
                          MessageItemList(
                            msg: MessageModelList(
                              username: 'Fulano 5',
                              statusMessage: "Online",
                              messageContent: "Oi!",
                              time: "1 dia atrás",
                              profile_asset: Config.assets.user4,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
        floatingActionButton: CustomButton(
          prefix: Icons.add_comment,
          onTap: () {},
        ));
  }
}
