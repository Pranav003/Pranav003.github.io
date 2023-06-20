import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GrowthTrackerPageRecord extends FirestoreRecord {
  GrowthTrackerPageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "head_circumference" field.
  double? _headCircumference;
  double get headCircumference => _headCircumference ?? 0.0;
  bool hasHeadCircumference() => _headCircumference != null;

  // "date_of_birth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  void _initializeFields() {
    _weight = castToType<double>(snapshotData['weight']);
    _height = castToType<double>(snapshotData['height']);
    _headCircumference = castToType<double>(snapshotData['head_circumference']);
    _dateOfBirth = snapshotData['date_of_birth'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('growth_tracker_page');

  static Stream<GrowthTrackerPageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GrowthTrackerPageRecord.fromSnapshot(s));

  static Future<GrowthTrackerPageRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GrowthTrackerPageRecord.fromSnapshot(s));

  static GrowthTrackerPageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GrowthTrackerPageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GrowthTrackerPageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GrowthTrackerPageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GrowthTrackerPageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GrowthTrackerPageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGrowthTrackerPageRecordData({
  double? weight,
  double? height,
  double? headCircumference,
  DateTime? dateOfBirth,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'weight': weight,
      'height': height,
      'head_circumference': headCircumference,
      'date_of_birth': dateOfBirth,
    }.withoutNulls,
  );

  return firestoreData;
}
