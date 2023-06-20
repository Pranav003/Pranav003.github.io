import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HeightRecord extends FirestoreRecord {
  HeightRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "age" field.
  double? _age;
  double get age => _age ?? 0.0;
  bool hasAge() => _age != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  void _initializeFields() {
    _age = castToType<double>(snapshotData['age']);
    _height = castToType<double>(snapshotData['height']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('height');

  static Stream<HeightRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HeightRecord.fromSnapshot(s));

  static Future<HeightRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HeightRecord.fromSnapshot(s));

  static HeightRecord fromSnapshot(DocumentSnapshot snapshot) => HeightRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HeightRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HeightRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HeightRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HeightRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHeightRecordData({
  double? age,
  double? height,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'age': age,
      'height': height,
    }.withoutNulls,
  );

  return firestoreData;
}
