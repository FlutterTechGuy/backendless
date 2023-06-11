import 'package:flutter/material.dart';
import 'package:flutter_application_1/model_views/lesson_viewmodel.dart';
import 'package:flutter_application_1/model_views/auth_viewmodel.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:provider/provider.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit Reflections"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthViewModel>().logoutUser();
                Navigator.pushReplacementNamed(context, loginScreen);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, addLesson);
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<LessonViewModel>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                ...List.generate(value.units.length, (index) {
                  final data = value.units[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.reflections,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data.unitDesc,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          thickness: 1,
                        )
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
