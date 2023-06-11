import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get isLoading => _loading;

  register({required String email, required String password}) async {
    _loading = true;
    notifyListeners();

    try {
      BackendlessUser user =
          BackendlessUser.fromJson({"email": email, "password": password});

      await Backendless.userService.register(user);
    } catch (e) {
      rethrow;
    }

    _loading = false;
    notifyListeners();
  }

  login({required String email, required String password}) async {
    _loading = true;
    notifyListeners();

    try {
      await Backendless.userService.login(
        email,
        password,
        true,
      );
    } catch (e) {
      rethrow;
    }
    _loading = false;
    notifyListeners();
  }

  forgetPassword({
    required String email,
  }) async {
    try {
      await Backendless.userService.restorePassword(email);
    } catch (e) {
      rethrow;
    }

    _loading = false;
    notifyListeners();
  }

  void logoutUser() async {
    try {
      await Backendless.userService.logout();
    } catch (e) {
      rethrow;
    }
  }
}
