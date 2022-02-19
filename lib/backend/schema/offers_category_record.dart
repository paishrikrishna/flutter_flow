import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'offers_category_record.g.dart';

abstract class OffersCategoryRecord
    implements Built<OffersCategoryRecord, OffersCategoryRecordBuilder> {
  static Serializer<OffersCategoryRecord> get serializer =>
      _$offersCategoryRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get thumbnail;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OffersCategoryRecordBuilder builder) => builder
    ..name = ''
    ..thumbnail = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('offers_category');

  static Stream<OffersCategoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OffersCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  OffersCategoryRecord._();
  factory OffersCategoryRecord(
          [void Function(OffersCategoryRecordBuilder) updates]) =
      _$OffersCategoryRecord;

  static OffersCategoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOffersCategoryRecordData({
  String name,
  String thumbnail,
}) =>
    serializers.toFirestore(
        OffersCategoryRecord.serializer,
        OffersCategoryRecord((o) => o
          ..name = name
          ..thumbnail = thumbnail));
