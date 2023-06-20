import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommArticle02Record extends FirestoreRecord {
  CommArticle02Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "textField" field.
  String? _textField;
  String get textField => _textField ?? '';
  bool hasTextField() => _textField != null;

  // "ratingBar" field.
  double? _ratingBar;
  double get ratingBar => _ratingBar ?? 0.0;
  bool hasRatingBar() => _ratingBar != null;

  void _initializeFields() {
    _textField = snapshotData['textField'] as String?;
    _ratingBar = castToType<double>(snapshotData['ratingBar']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comm_article_02');

  static Stream<CommArticle02Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommArticle02Record.fromSnapshot(s));

  static Future<CommArticle02Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommArticle02Record.fromSnapshot(s));

  static CommArticle02Record fromSnapshot(DocumentSnapshot snapshot) =>
      CommArticle02Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommArticle02Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommArticle02Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommArticle02Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommArticle02Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommArticle02RecordData({
  String? textField,
  double? ratingBar,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'textField': textField,
      'ratingBar': ratingBar,
    }.withoutNulls,
  );

  return firestoreData;
}
