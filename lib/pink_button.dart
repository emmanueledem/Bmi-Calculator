import 'package:flutter/material.dart';
import 'constants.dart';

class pink_button extends StatelessWidget {
  VoidCallback? onpress;
  String? ButtonName;
  pink_button({required this.onpress, required this.ButtonName});

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          ButtonName.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w800),
        ),
        color: Kbottomcontainercolor,
        margin: const EdgeInsets.only(top: 10),
        height: Kbottomcontainerheight,
        width: double.infinity,
      ),
    );
  }
}
