import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pedidodeorcamento_record.g.dart';

abstract class PedidodeorcamentoRecord
    implements Built<PedidodeorcamentoRecord, PedidodeorcamentoRecordBuilder> {
  static Serializer<PedidodeorcamentoRecord> get serializer =>
      _$pedidodeorcamentoRecordSerializer;

  @nullable
  String get pedidonome;

  @nullable
  String get pedidodescricao;

  @nullable
  DateTime get datadopedido;

  @nullable
  String get emaildopedido;

  @nullable
  DocumentReference get pedidopersona;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PedidodeorcamentoRecordBuilder builder) =>
      builder
        ..pedidonome = ''
        ..pedidodescricao = ''
        ..emaildopedido = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pedidodeorcamento');

  static Stream<PedidodeorcamentoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  PedidodeorcamentoRecord._();
  factory PedidodeorcamentoRecord(
          [void Function(PedidodeorcamentoRecordBuilder) updates]) =
      _$PedidodeorcamentoRecord;

  static PedidodeorcamentoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPedidodeorcamentoRecordData({
  String pedidonome,
  String pedidodescricao,
  DateTime datadopedido,
  String emaildopedido,
  DocumentReference pedidopersona,
}) =>
    serializers.toFirestore(
        PedidodeorcamentoRecord.serializer,
        PedidodeorcamentoRecord((p) => p
          ..pedidonome = pedidonome
          ..pedidodescricao = pedidodescricao
          ..datadopedido = datadopedido
          ..emaildopedido = emaildopedido
          ..pedidopersona = pedidopersona));
