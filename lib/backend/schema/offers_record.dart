import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'offers_record.g.dart';

abstract class OffersRecord
    implements Built<OffersRecord, OffersRecordBuilder> {
  static Serializer<OffersRecord> get serializer => _$offersRecordSerializer;

  @nullable
  String get site;

  @nullable
  String get thumbnail;

  @nullable
  BuiltList<String> get category;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OffersRecordBuilder builder) => builder
    ..site = ''
    ..thumbnail = ''
    ..category = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('offers');

  static Stream<OffersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OffersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OffersRecord._();
  factory OffersRecord([void Function(OffersRecordBuilder) updates]) =
      _$OffersRecord;

  static OffersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOffersRecordData({
  String site,
  String thumbnail,
}) =>
    serializers.toFirestore(
        OffersRecord.serializer,
        OffersRecord((o) => o
          ..site = site
          ..thumbnail = thumbnail
          ..category = null));
