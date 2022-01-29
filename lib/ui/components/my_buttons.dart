import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.child,
    this.callBack,
    required this.color,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? callBack;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        onPressed: callBack,
        child: child,
      ),
    );
  }
}

class MyTextButton extends MyButton {
  MyTextButton({
    Key? key,
    required String text,
    required Color textColor,
    required Color color,
    double fontSize = 19,
    required VoidCallback? callBack,
  }) : super(
          key: key,
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
          callBack: callBack,
          color: color,
        );
}

class MyIconButton extends MyButton {
  MyIconButton({
    Key? key,
    required IconData icon,
    required Color iconColor,
    required Color color,
    double iconSize = 18,
    required VoidCallback? callBack,
  }) : super(
          key: key,
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
          callBack: callBack,
          color: color,
        );
}
