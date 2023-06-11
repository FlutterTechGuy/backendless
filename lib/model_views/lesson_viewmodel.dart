import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/unit.dart';

class LessonViewModel with ChangeNotifier {
  bool _fetching = false;
  bool get fetching => _fetching;
  bool _saving = false;
  bool get saving => _saving;

  List<LessonModel> _lessons = [];
  List<LessonModel> get units => _lessons;

  fetchData() async {
    _fetching = false;
    notifyListeners();
    List<LessonModel> fetchedData = [];
    try {
      final data = await Backendless.data.of('UnitEntry').find();

      for (var element in data!) {
        final data = LessonModel.fromMap(element!);
        fetchedData.add(data);
      }

      _lessons = fetchedData;
    } catch (e) {
      rethrow;
    }
    _fetching = false;
    notifyListeners();
  }

  void sendDataToBackendless(LessonModel unit) async {
    _saving = true;
    notifyListeners();
    try {
      await Backendless.data.of('UnitEntry').save(unit.toMap());
      fetchData();
    } catch (e) {
      return;
    }

    _saving = false;
    notifyListeners();
  }
}
