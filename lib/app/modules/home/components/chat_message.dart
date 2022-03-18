import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weellu_web/app/constants/config.dart';
import 'package:weellu_web/app/data/models/msg_model_list.dart';
import 'package:weellu_web/app/modules/home/widgets/button.dart';
import 'package:weellu_web/app/modules/home/widgets/chat_text_field.dart';
import 'package:weellu_web/app/modules/home/widgets/message_component.dart';

import '../widgets/item_profile.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage({
    Key key,
  }) : super(key: key);

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GoogleAuthProvider authProvider = GoogleAuthProvider();
  FirebaseAuth auth = FirebaseAuth.instance;
  User _currentUser;

  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        _currentUser = user;
      });
    });
  }

  Future<User> _getUser() async {
    if (_currentUser != null) {
      return _currentUser;
    }

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        _currentUser = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        try {
          final UserCredential userCredential =
              await FirebaseAuth.instance.signInWithCredential(credential);

          _currentUser = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
          } else if (e.code == 'invalid-credential') {}
        } catch (e) {}
      }
    }
    return _currentUser;
  }

  void _sendMessage({String text}) async {
    final User user = await _getUser();
    if (user == null) {
      _scaffoldKey.currentState.showSnackBar(
        const SnackBar(
          content: Text("Não foi possível fazer o login, tente novamente!"),
          backgroundColor: Colors.red,
        ),
      );
    }

    Map<String, dynamic> data = {
      "uid": user.uid,
      "senderName": user.displayName,
      "senderPhotoUrl": user.photoURL,
      "time": Timestamp.now(),
      "status": '1'
    };

    if (text != null) data['text'] = text;
    FirebaseFirestore.instance.collection('messages').add(data);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width <= 500;
    return Scaffold(
      key: _scaffoldKey,
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
                    child: Container(
                      padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('messages')
                            .orderBy('time')
                            .snapshots(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            default:
                              List<DocumentSnapshot> documents =
                                  snapshot.data.docs.reversed.toList();

                              return ListView.builder(
                                  padding: EdgeInsets.only(right: 30),
                                  reverse: true,
                                  itemCount: documents.length,
                                  itemBuilder: (context, index) {
                                    return MessageComponent(
                                      isMe: documents[index].get('uid') ==
                                          _currentUser?.uid,
                                      status: documents[index].get('status'),
                                      data: documents[index].data(),
                                    );
                                  });
                          }
                        },
                      ),
                      // child: Column(
                      //   children: [
                      //     const MessageComponent(
                      //       message:
                      //           "Em linguística, a noção de texto é ampla e ainda aberta a uma definição mais precisa. Grosso modo, pode ser entendido como manifestação linguística das ideias de um autor, que serão interpretadas pelo leitor de acordo com seus conhecimentos linguísticos e culturais. Seu tamanho é variável.",
                      //     ),
                      //     const MessageComponent(
                      //       message: "Oi! Tudo bem?",
                      //     ),
                      //     const MessageComponent(
                      //       status: MessageStatus.READ,
                      //       message: "Tudo ótimo, e vc?",
                      //       isMe: true,
                      //     ),
                      //     const MessageComponent(
                      //       status: MessageStatus.SEND,
                      //       message:
                      //           "Você pode editar essas fotos e enviar novamente para mim? ",
                      //       isMe: true,
                      //     ),
                      //     MessageComponent(
                      //       file: MyFile(size: 65.36, name: " Fotos.zip"),
                      //       isMe: true,
                      //       status: MessageStatus.SEND,
                      //     ),
                      //     const MessageComponent(
                      //       message: "Claro!",
                      //     ),
                      //     const MessageComponent(
                      //       message: "Aqui estão as fotos editadas ",
                      //     ),
                      //     MessageComponent(
                      //       file: MyFile(
                      //           size: 65.36, name: " Fotos editadas.zip"),
                      //     ),
                      //     const CustomDivider(
                      //       date: "3 dias atrás",
                      //     ),
                      //     const MessageComponent(
                      //       status: MessageStatus.UNSEND,
                      //       message: "Valeu!",
                      //       isMe: true,
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                  _isLoading ? const LinearProgressIndicator() : Container(),
                  ChatTextField(
                    sendMessage: _sendMessage,
                    hintText: "Escreva uma mensagem... ",
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
