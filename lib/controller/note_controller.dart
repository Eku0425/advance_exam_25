import 'package:get/get.dart';

import '../helper/note_helper.dart';
import '../modal/note_modal.dart';

class NoteController extends GetxController {
  RxList<Notesmodal> noteList = <Notesmodal>[].obs;
  RxList<Notesmodal> favList = <Notesmodal>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      noteList.value = await DBHelper.dbHelper.getItem();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  Future<void> addFavItem(String heading, String notes) async {
    if (heading.isNotEmpty && notes.isNotEmpty) {
      Notesmodal notesmodal = Notesmodal(heading: heading, notes: notes);
      await DBHelper.dbHelper.insertData(notesmodal);
    } else {
      print("Name or Description is empty");
    }
  }

  Future<void> addItem(String heading, String notes) async {
    if (heading.isNotEmpty && notes.isNotEmpty) {
      Notesmodal notesmodal = Notesmodal(heading: heading, notes: notes);
      await DBHelper.dbHelper.addFavourite(notesmodal);
      await fetchData();
    } else {
      print("Name or Description is empty");
    }
  }

  Future<void> updateItem(Notesmodal item) async {
    try {
      await DBHelper.dbHelper.updateData(item);
      await fetchData();
    } catch (e) {
      print("Error updating item: $e");
    }
  }

  Future<void> deleteItem(int id) async {
    try {
      await DBHelper.dbHelper.deleteData(id);
      await fetchData();
    } catch (e) {
      print("Error deleting item: $e");
    }
  }
}
