import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';

import 'package:part_wit/utiles/utility.dart';


class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final profile_formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

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
            key: profile_formKey,
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
                  data: 'createProfile'.tr,
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                imageProfile(context),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                  LightTextBody(data: 'uploadProfile'.tr,),
                SizedBox(
                  height: screenSize.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40,  0),
                  child: TextFormField(
                    style: const TextStyle(
                        color: MyAppTheme.textPrimary,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                    enabled: true,
                    obscureText: false,
                    //  controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyAppTheme.buttonShadow_Color,
                      hintText: 'yourName'.tr,
                      prefixIcon: Image.asset(MyImages.ic_feather_user),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: MyAppTheme.buttonShadow_Color),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: MyAppTheme.buttonShadow_Color),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: MyAppTheme.whiteColor, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
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
                        'continue'.tr,

                        onPressed: () {
                          try {
                            Get.toNamed(MyRouter.welcomeScreen);
                          } on Exception catch (e) {
                            e.printError();
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

  imageProfile(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
              child: InkWell(
            onTap: () {
              OpenSheet();
            },
            child: getImageWidget(),
          )),
          Positioned(
            bottom: 8,
            right: 5,
            child: InkWell(
              onTap: () {
                OpenSheet();
              },
              child: const Icon(
                Icons.add_circle_outline,
                color: Colors.blue,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future takePhoto(ImageSource source) async {
    try {} on Exception catch (_, e) {
      print('Failed to pic image $e');
    }
    final _imageFile = await _picker.pickImage(source: source);
    if (_imageFile == null) return;

    final imageTemporary = File(_imageFile.path);
    this._imageFile = imageTemporary;
    setState(() => this._imageFile = imageTemporary);
  }

  getImageWidget() {

    if (_imageFile != null) {
      return CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 60,
        child: CircleAvatar(
          radius: 58.0,
          backgroundImage: Image.file(_imageFile!).image,
        ),
      );
    } else {
      return const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 60,
          child: CircleAvatar(
            radius: 58,
            backgroundImage: AssetImage(MyImages.ic_person //Convert File type of image to asset image path),
            ),
          ));
    }



  }

  void OpenSheet() {
    showModalBottomSheet(
      context: context,
      builder: ((builder) => bottomSheet(context)),
    );
  }

  bottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text('Choose Profile Photo',
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Opensans',
                  fontWeight: FontWeight.w400,
                  fontSize: 20)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: const Icon(
                  Icons.camera,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Get.back();
                  takePhoto(ImageSource.camera);
                },
                label: const Text('Camera',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Opensans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
              ),
              TextButton.icon(
                icon: const Icon(
                  Icons.image,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Get.back();
                  takePhoto(ImageSource.gallery);
                },
                label: const Text('Gallery',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Opensans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
              )
            ],
          )
        ],
      ),
    );
  }
}
