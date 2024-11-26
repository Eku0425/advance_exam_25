class Notesmodal {
  int? id;
  String? heading, notes;

  Notesmodal({this.id, required this.heading, required this.notes});

  factory Notesmodal.fromMap(Map m1) {
    return Notesmodal(id: m1['id'], heading: m1['heading'], notes: m1['notes']);
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'heading': heading,
      'notes': notes,
    };
  }
}
