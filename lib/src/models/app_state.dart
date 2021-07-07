library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void Function(AppStateBuilder b) updates]) = _$AppState;
  factory AppState.fromJson(dynamic json) => serializers.deserializeWith(serializer, json) as AppState;
  
  AppState._();
  
  
  Map<String, dynamic> get json => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  
  static Serializer<AppState> get serializer => _$Serializer;
}