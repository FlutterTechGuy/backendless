// ignore_for_file: use_build_context_synchronously

import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model_views/lesson_viewmodel.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:provider/provider.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  void initState() {
    userSession();

    super.initState();
  }

  userSession() async {
    final isValidLogin = await Backendless.userService.isValidLogin();

    if (isValidLogin!) {
      context.read<LessonViewModel>().fetchData();
      Navigator.pushReplacementNamed(context, homeScreen);
    } else {
      Navigator.pushReplacementNamed(context, loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
