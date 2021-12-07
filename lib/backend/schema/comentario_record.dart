import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comentario_record.g.dart';

abstract class ComentarioRecord
    implements Built<ComentarioRecord, ComentarioRecordBuilder> {
  static Serializer<ComentarioRecord> get serializer =>
      _$comentarioRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'User')
  DocumentReference get user;

  @nullable
  String get titulo;

  @nullable
  @BuiltValueField(wireName: 'Text')
  String get text;

  @nullable
  @BuiltValueField(wireName: 'Court')
  DocumentReference get court;

  @nullable
  @BuiltValueField(wireName: 'Court_quality')
  double get courtQuality;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ComentarioRecordBuilder builder) => builder
    ..titulo = ''
    ..text = ''
    ..courtQuality = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comentario');

  static Stream<ComentarioRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ComentarioRecord._();
  factory ComentarioRecord([void Function(ComentarioRecordBuilder) updates]) =
      _$ComentarioRecord;

  static ComentarioRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createComentarioRecordData({
  DocumentReference user,
  String titulo,
  String text,
  DocumentReference court,
  double courtQuality,
}) =>
    serializers.toFirestore(
        ComentarioRecord.serializer,
        ComentarioRecord((c) => c
          ..user = user
          ..titulo = titulo
          ..text = text
          ..court = court
          ..courtQuality = courtQuality));
