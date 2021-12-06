import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_body_underline.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utiles/constant.dart';
import 'package:part_wit/utiles/utility.dart';

import 'package:pinput/pin_put/pin_put.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final verification_formKey = GlobalKey<FormState>();

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: MyAppTheme.pin_bg_Color),
      borderRadius: BorderRadius.circular(5.0),
      color: MyAppTheme.pin_bg_Color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final Object? getArg = ModalRoute.of(context)!.settings.arguments;

    print("rcvd fdata ${getArg}");

    return GestureDetector(
      onTap: () {
        ///hide keyboard function
        Utility.hideKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: MyAppTheme.backgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: verification_formKey,
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.10,
                ),
                Center(
                  child: Image.asset(MyImages.ic_app_logo),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                LightTextHead(
                  data: 'verification'.tr,
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                LightTextBody(
                  data: 'enter_verification_code'.tr,
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                LightTextBody(
                  data: 'sendCode'.tr,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: screenWidth > 600 ? screenWidth * 0.2 : 16),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            screenWidth * 0.050, 0, screenWidth * 0.050, 0),
                        color: MyAppTheme.backgroundColor,
                        child: PinPut(
                          fieldsCount: 4,
                          //onSubmit: (String pin) => _showSnackBar(pin, context),
                          focusNode: _pinPutFocusNode,
                          controller: _pinPutController,
                          cursorColor: MyAppTheme.whiteColor,
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: MyAppTheme.textPrimary,
                              fontWeight: FontWeight.bold),
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          selectedFieldDecoration: _pinPutDecoration,
                          followingFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      CustomButton(
                        'submit'.tr,

                        onPressed: () {
                          if (verification_formKey.currentState!.validate()) {
                            FocusScope.of(this.context)
                                .requestFocus(FocusNode());
                            try {
                              Get.toNamed(MyRouter.resetNewPasswordScreen);
                            } on Exception catch (e) {
                              e.printError();
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                LightTextBody(
                  data: 'dont_receive'.tr + '?',
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                LightTextBodyBlack(
                  data: 'resendCode'.tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
