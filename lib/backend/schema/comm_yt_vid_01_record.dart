import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommYtVid01Record extends FirestoreRecord {
  CommYtVid01Record._(
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
      FirebaseFirestore.instance.collection('comm_yt_vid_01');

  static Stream<CommYtVid01Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommYtVid01Record.fromSnapshot(s));

  static Future<CommYtVid01Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommYtVid01Record.fromSnapshot(s));

  static CommYtVid01Record fromSnapshot(DocumentSnapshot snapshot) =>
      CommYtVid01Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommYtVid01Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommYtVid01Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommYtVid01Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommYtVid01Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommYtVid01RecordData({
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
