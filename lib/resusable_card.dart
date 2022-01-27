import 'package:flutter/material.dart';

class reusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardchild;
  // final Function onpress;

  const reusableCard({required this.colour, required this.cardchild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   onpress
      // },
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
             color: colour),
        child: cardchild,
      ),
    );
  }
}
