import 'package:flutter/material.dart';
import 'package:weellu_web/app/constants/config.dart';

class CustomButton extends StatelessWidget {
  String title;
  final Function onTap;
  final double radius;
  final IconData prefix;

  CustomButton({Key key, this.onTap, this.radius = 30, this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 15, bottom: 35, top: 2),
        child: Container(
          height: 57,
          width: 57,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Config.colors.shadowButtonColor.withOpacity(.15),
                  offset: const Offset(6, 6),
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: Config.colors.shadowButtonColor.withOpacity(.15),
                  offset: const Offset(6, 6),
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: Config.colors.shadowButtonColor.withOpacity(.15),
                  offset: const Offset(6, 6),
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(radius),
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.center,
                  colors: [
                    Config.colors.appBarMainColor,
                    Config.colors.appBarMainColor,
                  ])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefix != null)
                Icon(
                  prefix,
                  color: Colors.white,
                  size: 30,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  String title;
  final Function onTap;
  final double radius;
  final IconData prefix;

  CustomElevatedButton(
      {Key key, this.onTap, this.title, this.radius = 6, this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Config.colors.shadowButtonColor.withOpacity(.15),
                offset: const Offset(6, 6),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Config.colors.shadowButtonColor.withOpacity(.15),
                offset: const Offset(6, 6),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Config.colors.shadowButtonColor.withOpacity(.15),
                offset: const Offset(6, 6),
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.bottomLeft,
                colors: [
                  Config.colors.mainColor,
                  Config.colors.mainColor,
                  Config.colors.mainColor.withOpacity(.5)
                ])),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefix != null)
              Icon(
                prefix,
                color: Colors.white,
                size: 20,
              ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: Config.styles.primaryTextStyle.copyWith(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RBtn extends StatelessWidget {
  final Color bgColor;
  final Color color;
  final IconData icon;
  final Function onPressed;
  const RBtn({Key key, this.icon, this.onPressed, this.color, this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(30),
      shadowColor: Config.colors.textColorMenu,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
          child: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}

class RBtn2 extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Function onPressed;
  const RBtn2({Key key, this.icon, this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 2),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          color: color,
          size: 30,
        ),
      ),
    );
  }
}
