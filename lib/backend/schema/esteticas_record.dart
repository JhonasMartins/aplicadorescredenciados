import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'esteticas_record.g.dart';

abstract class EsteticasRecord
    implements Built<EsteticasRecord, EsteticasRecordBuilder> {
  static Serializer<EsteticasRecord> get serializer =>
      _$esteticasRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Nome')
  String get nome;

  @nullable
  @BuiltValueField(wireName: 'Local')
  LatLng get local;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EsteticasRecordBuilder builder) =>
      builder..nome = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Esteticas');

  static Stream<EsteticasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  EsteticasRecord._();
  factory EsteticasRecord([void Function(EsteticasRecordBuilder) updates]) =
      _$EsteticasRecord;

  static EsteticasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEsteticasRecordData({
  String nome,
  LatLng local,
}) =>
    serializers.toFirestore(
        EsteticasRecord.serializer,
        EsteticasRecord((e) => e
          ..nome = nome
          ..local = local));
