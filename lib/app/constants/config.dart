import 'package:flutter/material.dart';

enum MenuItemSelect {
  HOME,
  CHAT,
  CONTACTS,
  SHOPPING,
  NOTIIFICATIONS,
  SETTINGS,
}

class Config {
  static final styles = _Style();
  static final colors = _Color();
  static final assets = _Asset();
}

class _Asset {
  final message = "assets/icons/msg.svg";
  final home = "assets/icons/appli.svg";
  final contact = "assets/icons/user.svg";
  final notification = "assets/icons/notif.svg";
  final calendar = "assets/icons/calendar.svg";
  final settings = "assets/icons/setting.svg";
  final arrow_down = "assets/icons/arrow_down.svg";
  final signOut = "assets/icons/log_out.svg";
  final write = "assets/icons/write.svg";
  final record = "assets/icons/record.svg";
  final user = "assets/images/profil.png";
  final user1 = "assets/images/Dog_1.png";
  final user2 = "assets/images/Dog_2.png";
  final user3 = "assets/images/Dog_3.png";
  final user4 = "assets/images/Dog_4.png";
}

class _Style {
  final primaryTextStyle = TextStyle(
      color: Config.colors.primaryBlackColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal);
}

class _Color {
  final textColor = Color(0xFFCCC7c5);
  final mainColor = Color(0xFF89dad0);
  final iconColor1 = Color(0xFFffd28d);
  final iconColor2 = Color(0xFFfcab88);
  final paraColor = Color(0xFF8f837f);
  final buttonBackgroundCollor = Color(0xFFf7f6f4);
  final signColor = Color(0xFFa9a29f);
  final titleColor = Color(0xFF5c524f);
  final mainBlackColor = Color(0xFF332d2b);
  final yellowColor = Color(0xFFffd379);
  final elevatedButtonMainColor = Color(0xFF1A746B);
  final appBarMainColor = Color(0xFF1A746B);
  final tabBarUnselectedColor = Color(0xff63bfb6);
  final tabBarSelectedColor = Colors.white;
  final bottomNavBarUnselectedColor = Colors.grey;
  final bottomNavBarSelectedColor = Colors.black;
  final bodyBackgroundColor = Color(0xFFDCF0F0);
  final appBarForegroundColor = Colors.white;
  final appBarTextColor = Colors.white;
  final appBarIconColor = Colors.white;
  final bodyTextColor = Colors.black;
  final primaryColor = Color(0xFF2A8BF2);
  final primaryBlackColor = Color(0xFF0D1C2E);
  final textColorMenu = Color(0xFF707C97);
  final backgroundColor1 = Color(0xFFF3F3FB);
  final backgroundColor2 = Color(0xFFFDFBFD);
  final notifColor = Color(0xFFFF3366);
  final backgroundHeaderChat = Color(0xFFFAFBFF);
  final backgroundFile = Color(0xFF231F20);
  final checkColor = Color(0xFFB7BDCB);
  final shadowButtonColor = Color.fromRGBO(42, 139, 242, 1);
  final shadowCurrentUserChat = Color.fromRGBO(112, 124, 151, 1);
  final dividerColor = Color.fromRGBO(112, 124, 151, 0.1);
  final doubleCheckColor = Color.fromARGB(255, 29, 145, 33);
  final checkyellowColor = Color.fromARGB(255, 228, 157, 3);
  final checkRedColor = Color.fromARGB(255, 235, 16, 0);
  final textBGColor = Color(4291617491);
}
