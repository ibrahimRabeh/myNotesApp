import 'package:mynewappmynotes/View/RegisterView.dart';
import 'package:mynewappmynotes/View/VerifyEmail.dart';
import 'package:mynewappmynotes/View/loginView.dart';
import 'package:mynewappmynotes/View/myNotesMainPage.dart';

class Routes {
  getLoginRoute(context) {
    return const loginView();
  }

  getMainPage(context) {
    return const Mynotesmainpage();
  }

  getVerifyEmail(context) {
    return const VerifyEmail();
  }

  getRegisterRoute(context) {
    return const RegisterView();
  }
}
