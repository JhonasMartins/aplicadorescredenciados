import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cadastro_de_veiculo_record.g.dart';

abstract class CadastroDeVeiculoRecord
    implements Built<CadastroDeVeiculoRecord, CadastroDeVeiculoRecordBuilder> {
  static Serializer<CadastroDeVeiculoRecord> get serializer =>
      _$cadastroDeVeiculoRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'User')
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'Tipodeveiculo')
  String get tipodeveiculo;

  @nullable
  @BuiltValueField(wireName: 'Marca')
  String get marca;

  @nullable
  String get modelo;

  @nullable
  @BuiltValueField(wireName: 'Placa')
  String get placa;

  @nullable
  @BuiltValueField(wireName: 'Cor')
  String get cor;

  @nullable
  @BuiltValueField(wireName: 'Fotodoveiculo')
  String get fotodoveiculo;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CadastroDeVeiculoRecordBuilder builder) =>
      builder
        ..tipodeveiculo = ''
        ..marca = ''
        ..modelo = ''
        ..placa = ''
        ..cor = ''
        ..fotodoveiculo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cadastro_de_veiculo');

  static Stream<CadastroDeVeiculoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  CadastroDeVeiculoRecord._();
  factory CadastroDeVeiculoRecord(
          [void Function(CadastroDeVeiculoRecordBuilder) updates]) =
      _$CadastroDeVeiculoRecord;

  static CadastroDeVeiculoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCadastroDeVeiculoRecordData({
  DocumentReference user,
  String tipodeveiculo,
  String marca,
  String modelo,
  String placa,
  String cor,
  String fotodoveiculo,
}) =>
    serializers.toFirestore(
        CadastroDeVeiculoRecord.serializer,
        CadastroDeVeiculoRecord((c) => c
          ..user = user
          ..tipodeveiculo = tipodeveiculo
          ..marca = marca
          ..modelo = modelo
          ..placa = placa
          ..cor = cor
          ..fotodoveiculo = fotodoveiculo));
