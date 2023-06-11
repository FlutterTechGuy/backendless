import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/unit.dart';
import 'package:flutter_application_1/model_views/lesson_viewmodel.dart';
import 'package:flutter_application_1/utils/snackbar.dart';
import 'package:provider/provider.dart';

class LesssonAddView extends StatefulWidget {
  const LesssonAddView({super.key});

  @override
  State<LesssonAddView> createState() => _LesssonAddViewState();
}

class _LesssonAddViewState extends State<LesssonAddView> {
  TextEditingController _reflectionController = TextEditingController();
  TextEditingController _unitDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Lesson Add',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _reflectionController,
              decoration: const InputDecoration(
                labelText: 'Reflections',
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              minLines: 3,
              maxLines: 5,
              controller: _unitDescController,
              decoration: const InputDecoration(
                labelText: 'Unit Desc',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 10.0),
            Consumer<LessonViewModel>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: () async {
                  String reflection = _reflectionController.text.trim();
                  String description = _unitDescController.text.trim();

                  // Example validation
                  if (reflection.isNotEmpty && reflection.isNotEmpty) {
                    value.sendDataToBackendless(LessonModel(
                        reflections: reflection, unitDesc: description));

                    Navigator.pop(context);
                  } else {
                    snackbar(context, mesage: 'Check you inputs');
                  }
                },
                child:
                    value.saving ? const Text("Loading..") : const Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
