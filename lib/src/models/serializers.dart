library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'serializers.g.dart';

abstract class Serializers implements Built<Serializers, SerializersBuilder> {
  factory Serializers([void Function(SerializersBuilder b) updates]) = _$Serializers;
  factory Serializers.fromJson(dynamic json) => serializers.deserializeWith(serializer, json) as Serializers;
  
  Serializers._();
  
  
  Map<String, dynamic> get json => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  
  static Serializer<Serializers> get serializer => _$Serializer;
}