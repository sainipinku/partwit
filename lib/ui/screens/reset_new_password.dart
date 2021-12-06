import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/ui/widgets/light_text_title.dart';
import 'package:part_wit/utiles/constant.dart';
import 'package:part_wit/utiles/utility.dart';
import 'package:get/get_core/src/get_main.dart';
class ResetNewPassword extends StatefulWidget {
  const ResetNewPassword({Key? key}) : super(key: key);

  @override
  _ResetNewPasswordState createState() => _ResetNewPasswordState();
}

class _ResetNewPasswordState extends State<ResetNewPassword> {
  final resetpass_formKey = GlobalKey<FormState>();
  bool _showPassword = false,_showconfirmPassword = false,_isPasswordFocus = false,_isConfirmPasswordFocus = false;
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confrimpasswordController = new TextEditingController();
  FocusNode passWordFocus = new FocusNode();
  FocusNode confrmPassWordFocus = new FocusNode();
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MyAppTheme.backgroundColor),
    );
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        ///hide keyboard function
        Utility.hideKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: MyAppTheme.backgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: resetpass_formKey,
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
                  data: 'setNewPsw'.tr,
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                  LightTextTitle(
                  data: 'setNewPassword'.tr,
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    style: const TextStyle(
                        color: MyAppTheme.textPrimary,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                    controller: _passwordController,
                    obscureText: !this._showPassword,
                    focusNode: passWordFocus,
                    onTap: () {
                      print("EMAIN TAP");
                      //emailFocus.unfocus();
                      setState(() {
                        _isConfirmPasswordFocus = false;
                        _isPasswordFocus = true;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIconConstraints: const BoxConstraints(
                          minHeight: 24,
                          minWidth: 24
                      ),
                      filled: true,
                      fillColor: MyAppTheme.buttonShadow_Color,
                      hintText: 'password'.tr,
                      prefixIcon:  Image.asset(MyImages.ic_padlock),
                      suffixIcon: Image.asset(MyImages.ic_eye_close),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: MyAppTheme.buttonShadow_Color),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: MyAppTheme.buttonShadow_Color),
                          borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: MyAppTheme.buttonShadow_Color, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    style: const TextStyle(
                        color: MyAppTheme.textPrimary,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                    controller: _confrimpasswordController,
                    obscureText: !this._showconfirmPassword,
                    focusNode: confrmPassWordFocus,
                    onTap: () {
                      print("EMAIN TAP");
                      //emailFocus.unfocus();
                      setState(() {
                        _isConfirmPasswordFocus = true;
                        _isPasswordFocus = false;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIconConstraints: const BoxConstraints(
                          minHeight: 44,
                          minWidth: 44
                      ),
                      filled: true,
                      fillColor: MyAppTheme.buttonShadow_Color,
                      hintText: 'confirmPsw'.tr,
                      prefixIcon:Image.asset(MyImages.ic_padlock),
                      suffixIcon: Image.asset(MyImages.ic_eye_open),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: MyAppTheme.buttonShadow_Color),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: MyAppTheme.buttonShadow_Color),
                          borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: MyAppTheme.buttonShadow_Color, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),


                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      CustomButton(
                       'submit'.tr,

                        onPressed: () {
                          if (resetpass_formKey.currentState!.validate()) {
                            _isConfirmPasswordFocus = false;
                            _isPasswordFocus = false;
                            FocusScope.of(this.context).requestFocus(FocusNode());
                            try {
                              Get.toNamed(MyRouter.homeScreen);
                            } on Exception catch (e) {
                              e.printError();
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
