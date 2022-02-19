import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'memberships_record.g.dart';

abstract class MembershipsRecord
    implements Built<MembershipsRecord, MembershipsRecordBuilder> {
  static Serializer<MembershipsRecord> get serializer =>
      _$membershipsRecordSerializer;

  @nullable
  String get user;

  @nullable
  @BuiltValueField(wireName: 'gym_id')
  String get gymId;

  @nullable
  String get valid;

  @nullable
  bool get latest;

  @nullable
  @BuiltValueField(wireName: 'valid_from')
  String get validFrom;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MembershipsRecordBuilder builder) => builder
    ..user = ''
    ..gymId = ''
    ..valid = ''
    ..latest = false
    ..validFrom = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('memberships');

  static Stream<MembershipsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MembershipsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MembershipsRecord._();
  factory MembershipsRecord([void Function(MembershipsRecordBuilder) updates]) =
      _$MembershipsRecord;

  static MembershipsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMembershipsRecordData({
  String user,
  String gymId,
  String valid,
  bool latest,
  String validFrom,
}) =>
    serializers.toFirestore(
        MembershipsRecord.serializer,
        MembershipsRecord((m) => m
          ..user = user
          ..gymId = gymId
          ..valid = valid
          ..latest = latest
          ..validFrom = validFrom));
