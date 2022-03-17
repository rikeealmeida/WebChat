import 'package:flutter/material.dart';
import 'package:weellu_web/app/constants/config.dart';

class FoldedItem extends StatefulWidget {
   FoldedItem({
    Key key,
    // For selecting those three line once press "Command+D"
    this.isLogout,
    this.icon,
    this.groupValue,
    this.value,
    this.onChanged,
    this.onTap,
  }) : super(key: key);
  final IconData icon;
  final groupValue, value;
  final Function(dynamic value) onChanged;
  final Function onTap;
   bool isLogout = false;

  @override
  State<FoldedItem> createState() => _FoldedItemState();
}

class _FoldedItemState extends State<FoldedItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.value == widget.groupValue;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: widget.isLogout
            ? widget.onTap
            : () {
                if (widget.onChanged != null)
                  widget.onChanged(widget.groupValue);
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
          ]),
        ),
      ),
    );
  }
}
