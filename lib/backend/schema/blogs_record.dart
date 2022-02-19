import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'blogs_record.g.dart';

abstract class BlogsRecord implements Built<BlogsRecord, BlogsRecordBuilder> {
  static Serializer<BlogsRecord> get serializer => _$blogsRecordSerializer;

  @nullable
  String get title;

  @nullable
  String get thumbnail;

  @nullable
  BuiltList<String> get saved;

  @nullable
  BuiltList<String> get category;

  @nullable
  String get type;

  @nullable
  String get url;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BlogsRecordBuilder builder) => builder
    ..title = ''
    ..thumbnail = ''
    ..saved = ListBuilder()
    ..category = ListBuilder()
    ..type = ''
    ..url = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blogs');

  static Stream<BlogsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BlogsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BlogsRecord._();
  factory BlogsRecord([void Function(BlogsRecordBuilder) updates]) =
      _$BlogsRecord;

  static BlogsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBlogsRecordData({
  String title,
  String thumbnail,
  String type,
  String url,
}) =>
    serializers.toFirestore(
        BlogsRecord.serializer,
        BlogsRecord((b) => b
          ..title = title
          ..thumbnail = thumbnail
          ..saved = null
          ..category = null
          ..type = type
          ..url = url));
