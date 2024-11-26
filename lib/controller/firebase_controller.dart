import 'dart:developer';

import 'package:advance_exam_25/modal/note_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoogleFirebaseServices {
  static GoogleFirebaseServices googleFirebaseServices =
      GoogleFirebaseServices._();
  GoogleFirebaseServices._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void allDataStore(Notesmodal note) {
    try {
      CollectionReference users = firestore.collection('contact');
      users.doc(note.id.toString()).set(note.toMap());
    } catch (e) {
      log(e.toString());
    }
  }

  Stream<QuerySnapshot<Object?>> getData() {
    Stream<QuerySnapshot> usersStream =
        firestore.collection('contact').snapshots();
    return usersStream;
  }
}
