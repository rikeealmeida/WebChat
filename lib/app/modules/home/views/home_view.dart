import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weellu_web/app/constants/colors.dart';

import '../components/chat_message.dart';
import '../components/list_chat.dart';
import '../components/sidebar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: SideBar(),
              ),
              const Expanded(
                flex: 7,
                child: ListChat(),
              ),
              const Expanded(
                flex: 8,
                child: ChatMessage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
