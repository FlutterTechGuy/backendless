import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/add_lesson.dart';
import 'package:flutter_application_1/model/home_screen.dart';
import 'package:flutter_application_1/model/login_view.dart';
import 'package:flutter_application_1/model/register_view.dart';

const String loginScreen = '/app/login';
const String registerScreen = '/app/register';
const String homeScreen = '/app/home';
const String addLesson = '/app/add/lesson';
Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case loginScreen:
      return MaterialPageRoute(builder: (_) => LoginView());
    case registerScreen:
      return MaterialPageRoute(builder: (_) => Registerview());
    case homeScreen:
      return MaterialPageRoute(builder: (_) => const Homeview());
    case addLesson:
      return MaterialPageRoute(builder: (_) => LesssonAddView());

    default:
      throw "Routes Not Found!";
  }
}
