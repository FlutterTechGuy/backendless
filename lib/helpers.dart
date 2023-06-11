import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_application_1/utils/snackbar.dart';
import 'package:provider/provider.dart';

import 'model_views/auth_viewmodel.dart';
import 'model_views/lesson_viewmodel.dart';

class AuthHelper {
  static loginUser(BuildContext context,
      {required String email, required String password}) async {
    try {
      await context
          .read<AuthViewModel>()
          .login(email: email, password: password);
      context.read<LessonViewModel>().fetchData();
      Navigator.pushReplacementNamed(context, homeScreen);
    } catch (e) {
      snackbar(context, mesage: e.toString());
    }
  }

  static registerUser(BuildContext context,
      {required String email, required String password}) async {
    try {
      await context
          .read<AuthViewModel>()
          .register(email: email, password: password);
      Navigator.pushReplacementNamed(context, loginScreen);
    } catch (e) {
      snackbar(context, mesage: e.toString());
    }
  }

  static forgotPass(BuildContext context, {required String email}) async {
    try {
      context.read<AuthViewModel>().forgetPassword(email: email);
    } catch (e) {
      snackbar(context, mesage: e.toString());
    }
  }
}
