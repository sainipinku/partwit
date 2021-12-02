import 'package:flutter/material.dart';
import 'package:part_wit/ui/styles/my_images.dart';

import 'light_text_body.dart';

class CustomButton extends StatelessWidget {
  final String inputText;
  final double height;
  final GestureTapCallback onPressed;


  const CustomButton(this.inputText, this.height, {Key? key,  required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(MyImages.ic_button_bg,),
            LightTextBody(
              data: inputText,
            ),
          ]
      ),
    );
  }
}
