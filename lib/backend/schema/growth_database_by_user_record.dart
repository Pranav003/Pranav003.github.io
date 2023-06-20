import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GrowthDatabaseByUserRecord extends FirestoreRecord {
  GrowthDatabaseByUserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "age" field.
  double? _age;
  double get age => _age ?? 0.0;
  bool hasAge() => _age != null;

  // "head" field.
  double? _head;
  double get head => _head ?? 0.0;
  bool hasHead() => _head != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  void _initializeFields() {
    _age = castToType<double>(snapshotData['age']);
    _head = castToType<double>(snapshotData['head']);
    _height = castToType<double>(snapshotData['height']);
    _weight = castToType<double>(snapshotData['weight']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('growth_database_by_user');

  static Stream<GrowthDatabaseByUserRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => GrowthDatabaseByUserRecord.fromSnapshot(s));

  static Future<GrowthDatabaseByUserRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GrowthDatabaseByUserRecord.fromSnapshot(s));

  static GrowthDatabaseByUserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GrowthDatabaseByUserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GrowthDatabaseByUserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GrowthDatabaseByUserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GrowthDatabaseByUserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GrowthDatabaseByUserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGrowthDatabaseByUserRecordData({
  double? age,
  double? head,
  double? height,
  double? weight,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'age': age,
      'head': head,
      'height': height,
      'weight': weight,
    }.withoutNulls,
  );

  return firestoreData;
}
