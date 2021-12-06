import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utiles/constant.dart';


class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final wlcm_formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
  return Scaffold(
    backgroundColor: MyAppTheme.backgroundColor,
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.15,
          ),
          Center(
            child: Image.asset(MyImages.ic_app_logo),
          ),
          SizedBox(
            height: screenSize.height * 0.03,
          ),
            LightTextHead(
            data:'welcome'.tr,
          ),
          SizedBox(
            height: screenSize.height * 0.05,
          ),


          const Padding(
            padding: EdgeInsets.all(16.0),
            child: LightTextBody(data: Constant.LOREM,),
          ),


          SizedBox(
            height: screenSize.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: [
                CustomButton(
                  'continue'.tr,
                  onPressed: () {
                    print('click mefff');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  }
}