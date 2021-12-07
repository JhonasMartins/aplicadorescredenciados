import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'estetica_record.g.dart';

abstract class EsteticaRecord
    implements Built<EsteticaRecord, EsteticaRecordBuilder> {
  static Serializer<EsteticaRecord> get serializer =>
      _$esteticaRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  DocumentReference get user;

  @nullable
  int get likes;

  @nullable
  double get value;

  @nullable
  String get image;

  @nullable
  @BuiltValueField(wireName: 'in_indoor')
  bool get inIndoor;

  @nullable
  String get video;

  @nullable
  String get nomedaestetica;

  @nullable
  LatLng get localizacao;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EsteticaRecordBuilder builder) => builder
    ..likes = 0
    ..value = 0.0
    ..image = ''
    ..inIndoor = false
    ..video = ''
    ..nomedaestetica = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('estetica');

  static Stream<EsteticaRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static EsteticaRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EsteticaRecord(
        (c) => c
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..likes = snapshot.data['likes']
          ..value = snapshot.data['value']
          ..image = snapshot.data['image']
          ..inIndoor = snapshot.data['in_indoor']
          ..video = snapshot.data['video']
          ..nomedaestetica = snapshot.data['nomedaestetica']
          ..localizacao = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..reference = EsteticaRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EsteticaRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'estetica',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  EsteticaRecord._();
  factory EsteticaRecord([void Function(EsteticaRecordBuilder) updates]) =
      _$EsteticaRecord;

  static EsteticaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEsteticaRecordData({
  DateTime createdAt,
  DocumentReference user,
  int likes,
  double value,
  String image,
  bool inIndoor,
  String video,
  String nomedaestetica,
  LatLng localizacao,
}) =>
    serializers.toFirestore(
        EsteticaRecord.serializer,
        EsteticaRecord((e) => e
          ..createdAt = createdAt
          ..user = user
          ..likes = likes
          ..value = value
          ..image = image
          ..inIndoor = inIndoor
          ..video = video
          ..nomedaestetica = nomedaestetica
          ..localizacao = localizacao));
