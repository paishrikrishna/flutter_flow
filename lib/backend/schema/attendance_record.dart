import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'attendance_record.g.dart';

abstract class AttendanceRecord
    implements Built<AttendanceRecord, AttendanceRecordBuilder> {
  static Serializer<AttendanceRecord> get serializer =>
      _$attendanceRecordSerializer;

  @nullable
  String get date;

  @nullable
  String get day;

  @nullable
  @BuiltValueField(wireName: 'gym_id')
  String get gymId;

  @nullable
  String get time;

  @nullable
  String get user;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AttendanceRecordBuilder builder) => builder
    ..date = ''
    ..day = ''
    ..gymId = ''
    ..time = ''
    ..user = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attendance');

  static Stream<AttendanceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AttendanceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AttendanceRecord._();
  factory AttendanceRecord([void Function(AttendanceRecordBuilder) updates]) =
      _$AttendanceRecord;

  static AttendanceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAttendanceRecordData({
  String date,
  String day,
  String gymId,
  String time,
  String user,
}) =>
    serializers.toFirestore(
        AttendanceRecord.serializer,
        AttendanceRecord((a) => a
          ..date = date
          ..day = day
          ..gymId = gymId
          ..time = time
          ..user = user));
