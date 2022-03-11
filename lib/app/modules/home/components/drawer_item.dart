import 'package:flutter/material.dart';
import 'package:weellu_web/app/constants/config.dart';

class DrawerListTile extends StatefulWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    this.title,
    this.icon,
    this.press,
    this.groupValue,
    this.value,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData icon;
  final groupValue, value;
  final Function(dynamic value) onChanged;

  @override
  State<DrawerListTile> createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.value == widget.groupValue;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          if (widget.onChanged != null) widget.onChanged(widget.groupValue);
        },
        onHover: (value) {
          isHover = value;
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: isHover
                  ? LinearGradient(
                      colors: [
                        Config.colors.mainColor,
                        Config.colors.appBarMainColor
                        // Colors.white.withOpacity(0.5),
                        // Colors.white.withOpacity(0.5),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0, 0.75],
                    )
                  : null),
          child: Row(children: [
            Container(
              height: 30,
              width: 2.5,
              decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  boxShadow: [
                    if (isSelected)
                      BoxShadow(
                          color: Config.colors.mainColor,
                          offset: Offset(3, -1),
                          blurRadius: 5)
                  ]),
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(widget.icon,
                color: isSelected
                    ? Config.colors.buttonBackgroundCollor
                    : isHover
                        ? Config.colors.appBarMainColor
                        : isSelected
                            ? Config.colors.mainColor
                            : Config.colors.mainColor

                // isHover ? Config.colors.appBarMainColor : Config.colors.mainColor,
                ),
            SizedBox(
              width: 10,
            ),
            Text(widget.title,
                style: TextStyle(
                    color: isSelected
                        ? Config.colors.buttonBackgroundCollor
                        : isHover
                            ? Config.colors.appBarMainColor
                            : isSelected
                                ? Config.colors.mainColor
                                : Config.colors.mainColor))
          ]),
        ),
      ),
    );
  }
}
