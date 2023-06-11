import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/loading_view.dart';
import 'package:flutter_application_1/model_views/lesson_viewmodel.dart';
import 'package:flutter_application_1/model_views/auth_viewmodel.dart';
import 'package:flutter_application_1/model/register_view.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Backendless.initApp(
    applicationId: '6EB0A679-826A-68C2-FF8C-9D20105E0C00',
    androidApiKey: '2404B4C1-B003-4DE1-A354-23EF3745B13A',
    iosApiKey: 'B8A4280B-6AE8-4F0F-B30B-82EBB279A41B',
  );
  runApp(const MainApp());
}

// e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => LessonViewModel()),
      ],
      child: MaterialApp(
        onGenerateRoute: onGenerateRoutes,
        debugShowCheckedModeBanner: false,
        home: LoadingView(),
      ),
    );
  }
}
