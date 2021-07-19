part of models;

abstract class Current implements Built<Current, CurrentBuilder> {
  factory Current([void Function(CurrentBuilder b) updates]) = _$Current;
  factory Current.fromJson(dynamic json) => serializers.deserializeWith(serializer, json)!;

  Current._();

  @BuiltValueField(wireName: 'temp')
  double? get temperatureKelvin;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<Current> get serializer => _$currentSerializer;
}