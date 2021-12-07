import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'servicos_record.g.dart';

abstract class ServicosRecord
    implements Built<ServicosRecord, ServicosRecordBuilder> {
  static Serializer<ServicosRecord> get serializer =>
      _$servicosRecordSerializer;

  @nullable
  String get serviconame;

  @nullable
  DocumentReference get user;

  @nullable
  String get descricaodoservico;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ServicosRecordBuilder builder) => builder
    ..serviconame = ''
    ..descricaodoservico = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Servicos');

  static Stream<ServicosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ServicosRecord._();
  factory ServicosRecord([void Function(ServicosRecordBuilder) updates]) =
      _$ServicosRecord;

  static ServicosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createServicosRecordData({
  String serviconame,
  DocumentReference user,
  String descricaodoservico,
}) =>
    serializers.toFirestore(
        ServicosRecord.serializer,
        ServicosRecord((s) => s
          ..serviconame = serviconame
          ..user = user
          ..descricaodoservico = descricaodoservico));
