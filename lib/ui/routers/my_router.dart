import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:part_wit/ui/screens/create_profile_screen.dart';
import 'package:part_wit/ui/screens/forgotpsw_screen.dart';
import 'package:part_wit/ui/screens/home_screen.dart';
import 'package:part_wit/ui/screens/location_screen.dart';
import 'package:part_wit/ui/screens/login_screen.dart';
import 'package:part_wit/ui/screens/profile/save_items_screen.dart';
import 'package:part_wit/ui/screens/profile/user_profile.dart';
import 'package:part_wit/ui/screens/reset_new_password.dart';
import 'package:part_wit/ui/screens/signup_screen.dart';
import 'package:part_wit/ui/screens/splash_screen.dart';
import 'package:part_wit/ui/screens/verification_screen.dart';
import 'package:part_wit/ui/screens/welcom_screen.dart';



class MyRouter {
  static var homeScreen = "/homeScreen";
  static var locationScreen = "/location";
  static var loginScreen = "/login";
  static var signupScreen = "/signup";
  static var resetNewPasswordScreen = "/resetNewPassword";
  static var verificationScreen = "/verificationScreen";
  static var createProfile = "/createProfile";
  static var welcomeScreen = "/welcomeScreen";
  static var forgotPassword = "/forgotPassword";
  static var userProfile = "/forgotPassword";
  static var saveItems = "/saveItems";

  static var route = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: MyRouter.homeScreen, page: () => const HomeScreen()),
    GetPage(name: MyRouter.locationScreen, page: () => const LocationScreen()),
    GetPage(name: MyRouter.loginScreen, page: () => const LoginScreen()),
    GetPage(name: MyRouter.signupScreen, page: () => const SignUpScreen()),
    GetPage(name: MyRouter.verificationScreen, page: () => const VerificationScreen()),
    GetPage(name: MyRouter.createProfile, page: () => const CreateProfile()),
    GetPage(name: MyRouter.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: MyRouter.forgotPassword, page: () => const ForgotPassword()),
    GetPage(name: MyRouter.resetNewPasswordScreen, page: () => const ResetNewPassword()),
    GetPage(name: MyRouter.userProfile, page: () => const UserProfile()),
    GetPage(name: MyRouter.saveItems, page: () => const SaveItems()),

  ];
}
