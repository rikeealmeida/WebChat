import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weellu_web/app/constants/config.dart';
import 'package:weellu_web/app/data/models/file.dart';
import 'package:weellu_web/app/data/models/msg_model_list.dart';
import 'package:weellu_web/app/modules/widgets/chat_text_field.dart';
import 'package:weellu_web/app/modules/widgets/message_component.dart';

import '../../widgets/button.dart';
import '../../widgets/item_profile.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage({
    Key key,
  }) : super(key: key);

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // User _currentUser;

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseAuth.instance.authStateChanges().listen((user) {
  //     setState(() {
  //       _currentUser = user;
  //     });
  //   });
  // }

  // Future<User> _getUser() async {
  //   if (_currentUser != null) {
  //     return _currentUser;
  //   }
  //   try {
  //     final GoogleSignInAccount googleSignInAccount =
  //         await googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;

  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);

  //     final UserCredential authResult =
  //         await FirebaseAuth.instance.signInWithCredential(credential);

  //     final User user = authResult.user;
  //     return user;
  //   } catch (error) {}
  // }

  // void _sendMessage({String text, File imgFile}) async {
  //   final User user = await _getUser();
  //   if (user == null) {
  //     _scaffoldKey.currentState.showSnackBar(
  //       const SnackBar(
  //         content: Text("Não foi possível fazer o login, tente novamente!"),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width <= 500;
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
            padding: isMobile ? EdgeInsets.zero : EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pattern-01.png"),
                  repeat: ImageRepeat.repeat,
                  colorFilter: ColorFilter.mode(
                    Color(4294108880).withOpacity(.5),
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
                      color: Colors.white,
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
                            const MessageComponent(
                              message:
                                  "Em linguística, a noção de texto é ampla e ainda aberta a uma definição mais precisa. Grosso modo, pode ser entendido como manifestação linguística das ideias de um autor, que serão interpretadas pelo leitor de acordo com seus conhecimentos linguísticos e culturais. Seu tamanho é variável.",
                            ),
                            const MessageComponent(
                              message: "Oi! Tudo bem?",
                            ),
                            const MessageComponent(
                              status: MessageStatus.READ,
                              message: "Tudo ótimo, e vc?",
                              isMe: true,
                            ),
                            const MessageComponent(
                              status: MessageStatus.SEND,
                              message:
                                  "Você pode editar essas fotos e enviar novamente para mim? ",
                              isMe: true,
                            ),
                            MessageComponent(
                              file: MyFile(size: 65.36, name: " Fotos.zip"),
                              isMe: true,
                              status: MessageStatus.SEND,
                            ),
                            const MessageComponent(
                              message: "Claro!",
                            ),
                            const MessageComponent(
                              message: "Aqui estão as fotos editadas ",
                            ),
                            MessageComponent(
                              file: MyFile(
                                  size: 65.36, name: " Fotos editadas.zip"),
                            ),
                            const CustomDivider(
                              date: "3 dias atrás",
                            ),
                            const MessageComponent(
                              status: MessageStatus.UNSEND,
                              message: "Valeu!",
                              isMe: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ChatTextField(
                    hintText: "Escreva uma mensagem...",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
