import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'blog_categories_record.g.dart';

abstract class BlogCategoriesRecord
    implements Built<BlogCategoriesRecord, BlogCategoriesRecordBuilder> {
  static Serializer<BlogCategoriesRecord> get serializer =>
      _$blogCategoriesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Name')
  String get name;

  @nullable
  String get thumbnail;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BlogCategoriesRecordBuilder builder) => builder
    ..name = ''
    ..thumbnail = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blog_categories');

  static Stream<BlogCategoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BlogCategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  BlogCategoriesRecord._();
  factory BlogCategoriesRecord(
          [void Function(BlogCategoriesRecordBuilder) updates]) =
      _$BlogCategoriesRecord;

  static BlogCategoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBlogCategoriesRecordData({
  String name,
  String thumbnail,
}) =>
    serializers.toFirestore(
        BlogCategoriesRecord.serializer,
        BlogCategoriesRecord((b) => b
          ..name = name
          ..thumbnail = thumbnail));
