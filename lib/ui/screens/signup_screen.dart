import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/custom_checkbox.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_body_underline.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utiles/constant.dart';
import 'package:part_wit/utiles/utility.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signupkey_formKey = GlobalKey<FormState>();
  bool _showPassword = false,_showconfirmPassword = false,_isPasswordFocus = false,_isEmailFocus = false,_isConfirmPasswordFocus = false;
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _confrimpasswordController = new TextEditingController();
  FocusNode passWordFocus = new FocusNode();
  FocusNode confrmPassWordFocus = new FocusNode();
  FocusNode emailFocus = new FocusNode();
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
            key: signupkey_formKey,
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
                const LightTextHead(
                  data: Constant.SIGNUP,
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 10),
                  child: TextFormField(
                    style: const TextStyle(
                        color: MyAppTheme.textPrimary,

                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                    obscureText: false,
                    focusNode: emailFocus,
                    controller: _emailController,
                    onTap: () {
                      setState(() {
                        _isEmailFocus = true;
                        _isPasswordFocus = false;
                        _isConfirmPasswordFocus = false;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email address';
                      } /*else if (!isEmail(_emailController.text)) {
                        return 'Please enter valid email address';
                      }*/
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyAppTheme.buttonShadow_Color,
                      hintText: Constant.USER_EMAIL,
                      prefixIcon: Image.asset(MyImages.ic_mail),
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
                              color: MyAppTheme.whiteColor, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
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
                        _isEmailFocus = false;
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
                      hintText: Constant.USER_PASSWORD,
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
                    obscureText: !this._showconfirmPassword,
                    focusNode: confrmPassWordFocus,
                    onTap: () {
                      print("EMAIN TAP");
                      //emailFocus.unfocus();
                      setState(() {
                        _isConfirmPasswordFocus = true;
                        _isPasswordFocus = false;
                        _isEmailFocus = false;
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
                      hintText: Constant.CONFIRM_PSW,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCheckbox(key: signupkey_formKey,),
                    SizedBox(width: screenSize.height * 0.001,),
                    const LightTextBody(data: Constant.AGREE),
                    SizedBox(width: screenSize.height * 0.001,),
                    const LightTextBodyBlack(data: Constant.TERMS,),
                    SizedBox(width: screenSize.height * 0.001,),
                    const LightTextBody(data: Constant.AND),
                    SizedBox(width: screenSize.height * 0.001,),

                    const LightTextBodyBlack(data: Constant.POLICY),
                  ],
                ),

                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      CustomButton(
                        Constant.REGISTER,
                        54,
                        onPressed: () {
                          if (signupkey_formKey.currentState!.validate()) {
                            _isConfirmPasswordFocus = false;
                            _isPasswordFocus = false;
                            _isEmailFocus = false;
                            FocusScope.of(this.context).requestFocus(FocusNode());
                            try {
                             // Get.toNamed(MyRouter.verificationScreen);
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
                  height: screenSize.height * 0.02,
                ),
                const LightTextBody(data: Constant.ENTER_SOCIAL_MEDIA),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(MyImages.ic_fb, ),
                    SizedBox(width: screenSize.height * 0.02,),
                    Image.asset(MyImages.ic_gplus, ),
                    SizedBox(width: screenSize.height * 0.02,),
                    Image.asset(MyImages.ic_mac, ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LightTextBody(data: Constant.ALREADY_AN_ACC),
                    SizedBox(width: screenSize.height * 0.01,),
                    const LightTextBodyBlack(data: Constant.SIGNIN_HERE,)
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


