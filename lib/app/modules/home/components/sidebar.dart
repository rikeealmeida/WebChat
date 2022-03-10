import 'package:flutter/material.dart';
import 'package:weellu_web/app/constants/colors.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    Key key,
  }) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    // final hovered = Matrix4.identity()..translate(0, -10, 0);
    // final transform = isHovered ? hovered : Matrix4.identity();
    return Builder(builder: (context) {
      return Drawer(
        backgroundColor: Color.fromARGB(255, 121, 216, 205),
        child: DrawerHeader(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.mainColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      blurStyle: BlurStyle.normal,
                      color: Colors.black.withAlpha(100),
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 150,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image(
                          image: AssetImage(
                            "assets/images/png-transparent-minecraft-sonic-mania-pixel-art-sonic-the-hedgehog-cartoon-character-pixel-art-game-text-sonic-the-hedgehog.png",
                          ),
                        ),
                      ),
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      child: const Text(
                        "Henrique Almeida dos Santos",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 20,
                color: Colors.black,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Row(
                      children: const [
                        Icon(Icons.home),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Home"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Row(
                      children: const [
                        Icon(Icons.chat),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Chat"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Row(
                      children: const [
                        Icon(Icons.people),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Contact"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Row(
                      children: const [
                        Icon(Icons.notifications),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Notification")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Row(
                      children: const [
                        Icon(Icons.calendar_month),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Calendar"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Row(
                      children: const [
                        Icon(Icons.settings),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Settings"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      );
    });
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
