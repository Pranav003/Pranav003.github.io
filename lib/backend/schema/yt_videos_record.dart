import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class YtVideosRecord extends FirestoreRecord {
  YtVideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "yt_vid" field.
  String? _ytVid;
  String get ytVid => _ytVid ?? '';
  bool hasYtVid() => _ytVid != null;

  void _initializeFields() {
    _ytVid = snapshotData['yt_vid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('yt_videos');

  static Stream<YtVideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => YtVideosRecord.fromSnapshot(s));

  static Future<YtVideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => YtVideosRecord.fromSnapshot(s));

  static YtVideosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      YtVideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static YtVideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      YtVideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'YtVideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is YtVideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createYtVideosRecordData({
  String? ytVid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'yt_vid': ytVid,
    }.withoutNulls,
  );

  return firestoreData;
}
