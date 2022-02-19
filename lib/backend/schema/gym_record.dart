import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'gym_record.g.dart';

abstract class GymRecord implements Built<GymRecord, GymRecordBuilder> {
  static Serializer<GymRecord> get serializer => _$gymRecordSerializer;

  @nullable
  String get area;

  @nullable
  @BuiltValueField(wireName: 'gym_id')
  String get gymId;

  @nullable
  String get name;

  @nullable
  String get thumbnail;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GymRecordBuilder builder) => builder
    ..area = ''
    ..gymId = ''
    ..name = ''
    ..thumbnail = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gym');

  static Stream<GymRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<GymRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  GymRecord._();
  factory GymRecord([void Function(GymRecordBuilder) updates]) = _$GymRecord;

  static GymRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createGymRecordData({
  String area,
  String gymId,
  String name,
  String thumbnail,
}) =>
    serializers.toFirestore(
        GymRecord.serializer,
        GymRecord((g) => g
          ..area = area
          ..gymId = gymId
          ..name = name
          ..thumbnail = thumbnail));
