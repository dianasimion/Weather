part of models;

abstract class Weather implements Built<Weather, WeatherBuilder> {
  factory Weather([void Function(WeatherBuilder b) updates]) = _$Weather;
  factory Weather.fromJson(dynamic json) => serializers.deserializeWith(serializer, json)!;

  Weather._();

  Current get current;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<Weather> get serializer => _$weatherSerializer;
}
